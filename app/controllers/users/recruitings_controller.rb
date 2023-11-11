class Users::RecruitingsController < ApplicationController

  before_action :authenticate_user!, only: [ :edit, :update, :destroy, :create, :owner]

  def index
    @recruiting = Recruiting.new
    @recruitings = Recruiting.all
  end

  def create
    @recruiting = Recruiting.new(recruiting_params)
        @recruiting.person_id = current_user.id
        if @recruiting.save
          redirect_to users_recruiting_path(@recruiting.id)
        else
          @recruitings = Recruiting.all
          render :index
        end
  end

  def show
    @recruiting = Recruiting.find(params[:id])
    @talk = Talk.new
  end

  def edit
    @recruiting = Recruiting.find(params[:id])
  end

  def update
    recruiting = Recruiting.find(params[:id])
    recruiting.update(recruiting_params)
    redirect_to users_recruiting_path(recruiting.id)
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
