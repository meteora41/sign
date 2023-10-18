class Users::RecruitingsController < ApplicationController
  
   before_action :authenticate_user!, only: [:edit, :update, :destroy, :create]

  def index
    @recruiting = Recruiting.new
    @recruitings = Recruiting.all
  end

  def create
    @recruiting = Recruiting.new(recruiting_params)
        @recruiting.person_id = current_user.id
        @recruiting.save
          redirect_to users_recruiting_path(@recruiting.id)
  end

  def show
    @recruiting = Recruiting.find(params[:id])
    @talk = Talk.new
    @talks = Talk.all
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

  private

  def recruiting_params
    params.require(:recruiting).permit(:title, :comment, :datetime, :place)
  end


end
