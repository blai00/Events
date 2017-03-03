class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attends, dependent: :destroy
  has_many :user_attends, through: :attends, source: :user
  
  has_many :comments, dependent: :destroy
  has_many :user_comments, through: :comments, source: :user
  
  
  validates :name, :date, :location, :state, presence: true
  validates :user_id, presence: true, on: :create
  
  private
  
  def self.filtered_events_by_state(state)
    events = Event.all
    instate_events = []
    outstate_events = []
    events.each do |event|
      if event.state == state 
        instate_events << event
      else
        outstate_events << event
      end
    end
    return {instate: instate_events, outstate: outstate_events }
  end
  
end
