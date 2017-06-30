class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit, :update, :destroy]
    def create
        Comment.create(content: params[:content], event_id: params[:event_id], user_id: current_user.id)
        redirect_to event_url(params[:event_id])
    end
    
    def destroy
        @comment.destroy
        redirect_to(:back)
        
    end
    
    private
    def set_comment
        @comment = Comment.find(params[:id])
    end 
    
    
    
end