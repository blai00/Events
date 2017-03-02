class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attends, dependent: :destroy
  has_many :user_attends, through: :attends, source: :user
  
  has_many :comments, dependent: :destroy
  has_many :user_comments, through: :comments, source: :user
  
  
  validates :name, :date, :location, :state, presence: true
  validates :user_id, presence: true, on: :create
end
