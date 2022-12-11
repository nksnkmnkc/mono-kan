class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アソシエーション
  has_many :utilizations, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  #バリテーション
  validates :first_name, presence:true, length: { minimum: 1, maximum: 20 }
  validates :last_name, presence:true, length: { minimum: 1, maximum: 20 }
  validates :grade, presence:true
  validates :subject, presence:true
  validates :club, presence:true
  validates :another, presence:true

  #退会機能
  # is_deletedがfalseならtrueを返すようにしている
  #ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約を設ける
  def active_for_authentication?
    super && (is_deleted == false)
  end

end
