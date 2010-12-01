class Textbook < ActiveRecord::Base
  has_one :ad
  validates_presence_of :name, :author, :edition
  validates_numericality_of :edition, :only_integer => true
end
