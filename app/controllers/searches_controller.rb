class SearchesController < ApplicationController
  
  before_action :authenticate_user!
  
  def search
    @word = params[:word]
    @recruitings = Recruiting.looks(params[:search], params[:word])
  end

end
