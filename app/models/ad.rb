class Ad < ActiveRecord::Base
    belongs_to :textbook
    belongs_to :user
    validates_presence_of :type, :price, :description
    validates_numericality_of :price
end
