# require 'bcrypt'

class User < ApplicationRecord
    has_secure_password
    # validates :username, uniqueness: { case_sensitive: false }
   
    has_many :likes
    has_many :comments
    has_many :replies
    has_many :posts

    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :leaders, through: :followed_users

    has_many :following_users, foreign_key: :leader_id, class_name: 'Follow'
    has_many :followers, through: :following_users
    
end
