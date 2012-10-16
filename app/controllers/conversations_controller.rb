class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @conversations = Conversation.all
    @conversations.each do |conversation|
      conversation.name = ""
      conversation.users.split(",").each do |i|
        user = User.find(i.to_i)
        conversation.name +=   user.name + ", "
      end
        conversation.name = conversation.name.chomp(", ")
        conversation.save
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
  def leave
    @conversation = Conversation.find(params[:id])
    user_string = @conversation.users.split(",")
    user_string.delete(current_user.id.to_s)
    @conversation.users = user_string.join(",")
    @conversation.save
    redirect_to user_conversations_path(current_user)
  end
  def start
    @conversation = Conversation.new
    @user = User.find(params[:id])
    @conversation.users = ""
    @conversation.users += current_user.id.to_s + ","
    @conversation.users += @user.id.to_s
    @conversation.save
    redirect_to user_conversations_path(current_user)
  end
end