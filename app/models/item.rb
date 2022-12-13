class Item < ApplicationRecord
 
 #アソシエーション
  belongs_to :genre #ジャンル
  has_many:utilizations, dependent: :destroy #使用
  has_many :bookmarks, dependent: :destroy #ブックマーク
  
  Genre.select(:name)
  
  has_one_attached :image
  
  #バリテーション
  validates:name,presence: true,length: { minimum: 1, maximum: 20 }
  validates:memo, presence: true,length: { minimum: 1, maximum: 200 }
  
  def get_image(width,height)
    if image.attached?
      image.variant(resize_to_limit: [width, height]).processed
    else
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
  end

end
