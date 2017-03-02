class AttendsController < ApplicationController
    def create 
        Attend.create(user_id: current_user.id, event_id: params[:event_id])
        redirect_to events_url
    end
    
    def destroy
        attend = Attend.find(params[:id]).delete
        redirect_to events_url
    end

end
