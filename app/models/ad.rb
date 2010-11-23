class Ad < ActiveRecord::Base
    has_one :textbook
    belongs_to :user
end
