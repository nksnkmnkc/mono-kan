class Utilization < ApplicationRecord
  #アソシエーション
    belongs_to :teacher #先生
    belongs_to :item #消耗品

  #バリテーション
    validates :usage_rule, presence: true

  #enumを導入したためモデルに定義する（使用方法）
    enum usage_rule: { individual: 0, classwork: 1, club_activites: 2, committee: 3, event: 4 }
end
