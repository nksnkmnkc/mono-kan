class Public::HomesController < ApplicationController
 def top
  # @items = Item.order(created_at: :desc)
  @genres = Genre.all
 end
end
