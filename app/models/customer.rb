class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    enum sex: {no＿selection: 0, men: 1, woman: 2,}
    # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |end_user|
    customer.password = SecureRandom.urlsafe_base64
    # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
end
