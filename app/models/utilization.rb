class Utilization < ApplicationRecord
  #アソシエーション
    belongs_to :teacher
    belongs_to :items
end
