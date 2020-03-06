class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,authentication_keys:  [:login]

  attr_writer :login
  validates :username, presence:  true , uniqueness: {case_senstive: false}
  scope :user_list, ->(current_user) { where.not("id = ?", current_user.id) }
  
   has_many :received_follows, foreign_key: :followed_user_id, class_name: 'TweetFollow'
   has_many :followers, through: :received_follows, source: :follower

   has_many :given_follows, foreign_key: :follower_id, class_name: 'TweetFollow'
   has_many :followings, through: :given_follows, source: :followed_user
   has_many :tweets

   def login
   	@login || self.username || self.email
   end


   def self.find_for_database_authentication(warden_conditions)
   	conditions = warden_conditions.dup
   	if login = conditions.delete(:login)
   		where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value",{:value => login.downcase}]).first
   	elsif
   		where(conditions.to_h).first 
   	end
   end

   def user_tweets
   	return self.tweets
   end


  # has_many :received_follows, foregin_key: :followed_user_id, class_name: 'Follow'
  # has_many :followers, foregin_key: :followed_user_id, source: "received_follows"
end
