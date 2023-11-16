class Users::TalksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]


  def create
    @recruiting = Recruiting.find(params[:recruiting_id])
    @talk = Talk.new(talk_params)
    @talk.person_id = current_user.id

    @talk.recruiting_id = @recruiting.id
    @talk.save
    redirect_to users_recruiting_path(@recruiting)
  end

  def destroy
    Talk.find(params[:id]).destroy
    redirect_to users_recruiting_path(params[:recruiting_id])
  end



  private

  def talk_params
    params.require(:talk).permit(:conversation)
  end

end
