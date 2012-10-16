class Conversation < ActiveRecord::Base
  attr_accessible :users, :name
  has_many :messages
end
