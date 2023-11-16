class Users::PersonsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index, :create, :show, :edit, :update, :favorites ]
  
  def new
    @person = Person.new
  end

  def index
    @person = Person.find(current_user.id)

  end


  def create
      @person = Person.new(person_params)
      @person.user_id = current_user.id
      if @person.save
        redirect_to users_person_path(current_user.id)
      else
        flash.now[:handle] = "＊ハンドルネームを入力してください＊"
        @person = Person.new
        render :new
      end
  end


  def show
    @person = Person.find(params[:id])
    @recruitings = @person.recruitings.page(params[:page]).per(5)
  end


  def edit
    @person = Person.find(params[:id])
  end

  def update
    person = Person.find(params[:id])
    if person.update(person_params)
      flash[:notice] = "編集が完了しました。"
      redirect_to users_person_path(current_user.id)
    else
      flash.now[:alert] = "＊ハンドルネームを入力してください＊"
      @person = Person.find(params[:id])
      render :edit
    end
  end

  def favorites
    @person = Person.find(params[:id])
    favorites = Favorite.where(person_id: current_user.id).pluck(:recruiting_id)
    @favorite_posts = Recruiting.find(favorites)
    
  end

  private

  def person_params
    params.require(:person).permit(:handle, :gender, :age, :contact)
  end


end
