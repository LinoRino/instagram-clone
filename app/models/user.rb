class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  has_many :posts
  has_many :followers, foreign_key: :followed_id, class_name: 'Follower'
  has_many :followings, foreign_key: :follower_id, class_name: 'Follower'
end
