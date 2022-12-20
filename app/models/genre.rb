class Genre < ApplicationRecord
 #アソシエーション
 has_many :items #消耗品
 
 #検索方法分岐        完全一致以外の検索方法は、contentの前後(もしくは両方に)、__%__を追記することで定義することができる。where(カラム名: "検索したい文字列")
 def self.search_for(content, method)
  if method == 'perfect'
    Genre.where(name: content)
  elsif method == 'forward'
    Genre.where('name LIKE?', content + '%')
  elsif method == 'backward'
    Genre.where('name LIKE?', '%' + content)
  else
    Genre.where('name LIKE?', '%' + content + '%')
  end
 end
end
