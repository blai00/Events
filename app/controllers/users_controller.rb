class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to events_url
    else
      flash[:message] = user.errors.full_messages
      
      redirect_to new_session_url
    end
  end
  
  def edit
  end
  
  def update
    @user.update(user_params)
    redirect_to events_url
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  
end
