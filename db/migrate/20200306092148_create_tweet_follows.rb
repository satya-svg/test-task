class CreateTweetFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_follows do |t|
       t.integer :follower_id
       t.integer :followed_user_id
       t.timestamps
    end
  end
end
