class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :name

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
      if user.admin?
        user.name += " the admin"
      end
      user.save
    end
  end
end
