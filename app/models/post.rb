class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def liked_by?(user)
    Like.where(user_id: user.id, post_id: self.id).exists?
  end
end
