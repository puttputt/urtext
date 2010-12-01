class User < ActiveRecord::Base
  has_many :ads
  has_many :messages
  acts_as_authentic do |c|
    #c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  end # block optional
end
