class Message < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :username, :message
  validates_length_of :username, :maximum=> 15
  validates_length_of :message, :maximum => 100
end
