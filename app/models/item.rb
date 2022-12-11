class Item < ApplicationRecord
 #アソシエーション
  belongs_to :genre
  has_many:utilizations, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
end
