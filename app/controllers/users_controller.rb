class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @mutual_friends = User.where(id: show_five_friends)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  private

  def show_mutual_friends
    @ids = []
    current_user.friends.each do |people|
      people.friends.each do |f|
        @ids << f.id
      end
    end
    @ids.reject { |i| i == current_user.id }
  end

  def show_five_friends
    show_mutual_friends.sample(5)
  end
end
