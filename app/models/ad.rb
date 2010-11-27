class Ad < ActiveRecord::Base
    belongs_to :textbook
    belongs_to :user
end
