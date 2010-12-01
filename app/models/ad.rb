class Ad < ActiveRecord::Base
    belongs_to :textbook
    belongs_to :user
    has_many :bookmarks
    validates_presence_of :price, :description
    validates_numericality_of :price, :less_than => 1000
    validates_length_of :price, :maximum=> 10
    validates_length_of :description, :maximum=> 100
end
