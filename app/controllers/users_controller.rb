class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :name

  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @converstaions = Conversation.all
    @test_array = Array.new
    @converstaions.each do |conversation|
      @test_array << conversation.users
    end
    @test_string1 = current_user.id.to_s + "," + @user.id.to_s
    @test_string2 = @user.id.to_s + "," + current_user.id.to_s
  end

  private

  def name
    @users = User.all
    @users.each do |user|
      user.name = user.email[/[^@]+/]
      user.name.split(".").map {|n| n.capitalize }.join(" ")
      if user.admin?
        user.name += " the admin"
      end
      user.save
    end
  end
end
