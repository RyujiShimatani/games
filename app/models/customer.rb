class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_one_attached :image


   has_many :bulletin_boards, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_many :favorited_bulletin_boards, through: :favorites, source: :bulletin_board
   has_and_belongs_to_many :genres

   validates :nick_name, presence:true

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
  # 年齢を計算
  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

end
