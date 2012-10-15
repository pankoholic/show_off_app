class Message < ActiveRecord::Base
  attr_accessible :content, :conversation_id, :user_id
  belongs_to :conversation
end
