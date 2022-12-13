class Genre < ApplicationRecord
 #アソシエーション
 has_many :items #消耗品
end
