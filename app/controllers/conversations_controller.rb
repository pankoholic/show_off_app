class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @conversations = Conversation.all
  end
  def show
    @conversation = Conversation.find(params[:id])
    if current_user.id == @conversation.user1.to_i || current_user.id == @conversation.user2.to_i
      @messages = @conversation.messages
    else
      flash[:notice] = "Don't try to watch someone else conversations"
      redirect_to user_conversations_path(current_user)
    end
  end
  def new
    @conversation = Conversation.new
  end
  def create
    @conversation.user1 = current_user.id
    @conversation.user2 =
  end
end
