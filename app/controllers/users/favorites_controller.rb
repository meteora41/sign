class Users::FavoritesController < ApplicationController

  def create
    #recruiting = Recruiting.find(params[:recruiting_id])
    current_person_id = current_user.id
    favorite = Favorite.new(person_id: current_person_id, recruiting_id: params[:recruiting_id])
    favorite.save
    #redirect_to users_recruitings_path
    redirect_back(fallback_location: users_recruitings_path)
  end

  def destroy
    #recruiting = Recruiting.find(params[:recruiting_id])
    current_person_id = current_user.id
    favorite = Favorite.find_by(person_id: current_person_id, recruiting_id: params[:recruiting_id])#(recruiting_id: recruiting.id)
    favorite.destroy
    #redirect_to users_recruitings_path
    redirect_back(fallback_location: users_recruitings_path)

  end

  def index

  end

end
