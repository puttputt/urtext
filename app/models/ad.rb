class Ad < ActiveRecord::Base
    belongs_to :textbook
    belongs_to :user
    has_many :bookmarks
    validates_presence_of :price, :description
    validates_numericality_of :price
end
