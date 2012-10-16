class Conversation < ActiveRecord::Base
  attr_accessible :users
  has_many :messages
end
