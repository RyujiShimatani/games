class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_one_attached :image

   has_many :bulletin_boards, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :favorites, dependent: :destroy

    enum sex: {no＿selection: 0, men: 1, woman: 2,}
    # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.nick_name = "ゲスト"
    end
  end
  # is_deletedがfalseならtrueを返す
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
