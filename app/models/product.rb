class Product < ApplicationRecord

  has_one_attached :image

  validates :image, presence: true
  
  def favorited_by?(user)
    Favorite.find_by(
      user_id: user.id,
      product_id: id
    )
  end
end
