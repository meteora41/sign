class SearchesController < ApplicationController
  
  def search
    @word = params[:word]
    @recruitings = Recruiting.looks(params[:search], params[:word]).page(params[:page]).per(10)
  end

end
