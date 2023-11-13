class Users::RecruitingsController < ApplicationController

  before_action :authenticate_user!, only: [ :edit, :update, :destroy, :create, :owner]

  def index
    @recruiting = Recruiting.new
    @recruitings = Recruiting.all.page(params[:page]).per(10)
  end

  def create
    @recruiting = Recruiting.new(recruiting_params)
        @recruiting.person_id = current_user.id
        if @recruiting.save
          flash[:success] = "投稿が完了しました。"
          redirect_to users_recruiting_path(@recruiting.id)
        else
          @recruitings = Recruiting.all
          render :index
        end
  end

  def show
    @recruiting = Recruiting.find(params[:id])
    #@talks = Recruiting.page(params[:page]).per[2]
    @talk = Talk.new
  end

  def edit
    @recruiting = Recruiting.find(params[:id])
  end

  def update
    recruiting = Recruiting.find(params[:id])
    if recruiting.update(recruiting_params)
      flash[:complete] = "編集が完了しました。"
      redirect_to users_recruiting_path(recruiting.id)
    else
      flash.now[:alert] = "＊ タイトル または 希望日時 を正しく入力してください＊"
      @recruiting = Recruiting.find(params[:id])
      render :edit
    end
  end

  def destroy
    recruiting = Recruiting.find(params[:id])
    recruiting.destroy
    redirect_to users_recruitings_path
  end

  def owner
    @recruiting = Recruiting.find(params[:id])
    @person = Person.find(params[:id])
  end


  private

  def recruiting_params
    params.require(:recruiting).permit(:title, :comment, :datetime, :place)
  end


end
