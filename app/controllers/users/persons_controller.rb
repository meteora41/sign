class Users::PersonsController < ApplicationController

  def new
    @person = Person.new
  end
  
  def index
    @person = Person.find(current_user.id)
    
  end


  def create
      @person = Person.new(person_params)
      @person.user_id = current_user.id
      @person.save
      redirect_to users_person_path(current_user.id)

  end


  def show
    @person = Person.find(params[:id])
  end


  def edit
    @person = Person.find(params[:id])
  end
  
  def update
    person = Person.find(params[:id])
    person.update(person_params)
    redirect_to users_person_path(current_user.id)
  end

  private

  def person_params
    params.require(:person).permit(:handle, :gender, :age, :contact)
  end

end
