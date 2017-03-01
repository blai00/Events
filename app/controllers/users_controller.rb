class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to {}
    else
      flash[:message] = user.errors.full_messages
      redirect_to {}
    end 
  end
  
  def edit
  end
  
  private
  def user_params
    params.require(user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
  
end
