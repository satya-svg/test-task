class Api::V1::TweetFollowController < ApplicationController
	def follow
		tweet = TweetFollow.new(follower_id: current_user.id , followed_user_id: params[:id])
		if(tweet.save)
		   render json: {tweet: tweet,message: "successfully"},status: 200
		else
		   render json: {error: tweet.errors.full_message},status: 200
		end
	end

	def unfollow
		tweet = TweetFollow.find_by(follower_id: current_user.id , followed_user_id: params[:id])
		if(tweet.destroy)
		   render json: {tweet: tweet,message: "successfully"},status: 200
		else
		   render json: {error: tweet.errors.full_message},status: 200
		end
	end
end
