class Public::HomesController < ApplicationController
 def top
  #@items = Item.all.utilization(id: "DESC")
  #@items = Item.limit(4).utilization("created_at DESC")
  @genres = Genre.all
 end
end
