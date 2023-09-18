class BulletinBoard < ApplicationRecord
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :customer

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
