class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :name, :only => [:index, :show]

  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end

  private

  def name
    @users = User.all
    @users.each do |user|
      user.name = user.email[/[^@]+/]
      user.name.split(".").map {|n| n.capitalize }.join(" ")
      user.save
    end
  end
end
