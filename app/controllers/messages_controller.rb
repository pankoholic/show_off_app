class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @message = Message.new
  end
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.create(params[:message])
    @message.user_id = current_user.id
    @message.save
    redirect_to @conversation
  end
end