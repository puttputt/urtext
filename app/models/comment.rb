class Comment < ActiveRecord::Base
  has_one :user, :textbook
end
