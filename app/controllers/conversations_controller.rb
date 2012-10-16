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
    test_array = Array.new
    Conversation.all.each do |conversation|
      test_array << conversation.users
    end
    test_string1 = current_user.id.to_s + "," + @user.id.to_s
    test_string2 = @user.id.to_s + "," + current_user.id.to_s
    if not test_array.include?(test_string1) || test_array.include?(test_string2)
      @conversation.save
    end
    redirect_to user_conversations_path(current_user)
  end
end