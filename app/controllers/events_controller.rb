class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  def index
    @events = Event.filtered_events_by_state(current_user.state)
  end
  
  def create
    event = Event.create(event_params)
    puts event_params
    flash[:message] = event.errors.full_messages unless event.save
    redirect_to events_url
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @event.update(event_params)
    redirect_to events_url
  end
  
  def destroy
    @event.destroy
    redirect_to events_url
  end
  
  
  private
  
  def event_params
    params.require(:event).permit(:name, :date, :location, :state, :user_id)
  end
  
  def set_event
    @event = Event.find(params[:id])
  end
  
    
end
