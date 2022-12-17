class Favorite < ApplicationRecord

 #アソシエーション
 belongs_to :teacher
 belongs_to :item

 #バリテーション
 #一つのティーチャー（ユーザー）は同じ商品に対して一回しかお気に入りができませんというバリデーション
 validates :teacher_id, uniqueness: { scope: :item_id }
end
