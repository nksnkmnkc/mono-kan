class Utilization < ApplicationRecord
  #アソシエーション
    belongs_to :teacher #先生
    belongs_to :items #消耗品
end
