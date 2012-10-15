class Conversation < ActiveRecord::Base
  attr_accessible :user1, :user2
  belongs_to :user
  has_many :messages
end
