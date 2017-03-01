class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to event
    else
      flash[:message] = user.errors.full_messages
      puts user_params
      
      redirect_to new_session_url
    end
  end
  
  def edit
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  end
  
  
end
