class Public::HomesController < ApplicationController
 def top
  #@items = Item.all.utilization(id: "DESC")
  #@items = Item.limit(4).utilization("created_at DESC")
  #@items =Item.utilization.limit(4).order(created_at: :desc)
  @items = Item.eager_load(:utilizations).order("utilizations.created_at desc")
  @genres = Genre.all
 end
end
