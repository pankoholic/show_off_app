class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    Conversation.all.each do |conversation|
      if conversation.users.split(",").include?(current_user.id.to_s)
        @conversation = conversation
        @link = ""
        conversation.users.split(",").each do |i|
          user = User.find(i.to_i)
          @link += user.name + ", "
        end
        @link = @link.chomp(", ")
      else
        @link = "You don't have any conversations, yet."
      end
    end
  end
  def show
    @conversation = Conversation.find(params[:id])
    if @conversation.users.split(",").include?(current_user.id.to_s)
      @messages = @conversation.messages
    else
      redirect_to user_conversations_path(current_user)
    end
  end
  def new
    @conversation = Conversation.new
  end
  def create
    @conversation.users = ""
    @conversation.users += current_user.id.to_s
    @conversation.save
    redirect_to user_conversations_path(current_user)
  end
  def leave
    @conversation = Conversation.find(params[:id])
    user_string = @conversation.users.split(",")
    user_string.delete(current_user.id.to_s)
    @conversation.users = user_string.join(",")
    @conversation.save
    redirect_to user_conversations_path(current_user)
  end
end