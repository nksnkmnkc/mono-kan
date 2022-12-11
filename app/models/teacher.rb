class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アソシエーション
  has_many :utilizations, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  #プロフィール画像を扱うための記述
  has_one_attached :profile_image

  #バリテーション
  validates :first_name, presence:true, length: { minimum: 1, maximum: 20 }
  validates :last_name, presence:true, length: { minimum: 1, maximum: 20 }
  validates :grade, presence:true
  validates :subject, presence:true
  validates :club, presence:true
  validates :another, presence:true
  
  #プロフィール画像を扱うための記述
  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  #退会機能
  # is_deletedがfalseならtrueを返すようにしている
  #ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約を設ける
  def active_for_authentication?
    super && (is_deleted == false)
  end

end
