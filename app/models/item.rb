class Item < ApplicationRecord

 #アソシエーション
  belongs_to :genre #ジャンル
  has_many:utilizations, dependent: :destroy #使用
  has_many :favorites, dependent: :destroy #お気に入り

  Genre.select(:name)

  #商品画像を扱うための記述
  has_one_attached :image

  #バリテーション
  validates:name,presence: true,length: { minimum: 1, maximum: 20 }
  validates:memo, presence: true,length: { minimum: 1, maximum: 200 }

  #商品画像を扱うための記述
  def get_image(width,height)
    if image.attached?
      image.variant(resize_to_limit: [width, height]).processed
    else
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
  end

#お気に入り機能の追記 favrited_by?メソッド→引数で渡されたidがfavoritesテーブル内に存在するかどうか調べる
  def favorited_by?(teacher)
    favorites.exists?(teacher_id: teacher)
  end

end
