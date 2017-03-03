class CommentsController < ApplicationController
   
    def create
        Comment.create(content: params[:content], event_id: params[:event_id], user_id: current_user.id)
        redirect_to event_url(params[:event_id])
    end
    
    
    
end