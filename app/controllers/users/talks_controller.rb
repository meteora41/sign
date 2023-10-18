class Users::TalksController < ApplicationController
  
  def create
    recruiting = Recruiting.find(params[:recruiting_id])
    talk = Talk.new(talk_params)
    talk.user_id = current_person.id
    talk.recruiting_id = talk.id
    talk.save
    redirect_to users_recruiting_path(recruiting)
  end
  
  
  
  private
  
  def talk_params
    params.require(:talk).permit(:conversation)
  end
  
end
