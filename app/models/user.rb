class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name , :last_name, :location, :state, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false} , format: {with: EMAIL_REGEX}
  validates :password, length: {minimum: 6}, on: create
end
