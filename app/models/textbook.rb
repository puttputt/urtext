class Textbook < ActiveRecord::Base
  has_one :ad
  validates_presence_of :name, :author, :edition
  validates_numericality_of :edition, :only_integer => true, :less_than => 100
  validates_length_of :name, :maximum=> 20
  validates_length_of :author, :maximum=> 20
end
