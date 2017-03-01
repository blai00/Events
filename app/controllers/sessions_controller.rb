class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      session[user_id] = user.id
      redirect_to {}
    else 
      flash[:message] = user.errors.full_messages
      redirect to new_session
      
    end
  end 
end
