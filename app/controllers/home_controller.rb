class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  	@users =  User.user_list(current_user)
  	@followings  = current_user.followings
  	@followers  = current_user.followers
  	@my_tweets = current_user.user_tweets
  	@tweets = Tweet.all
  end


  def tweets
    current_user.tweets.create(content: params[:content])
    redirect_to root_path
  end
end
