class Public::FavoritesController < ApplicationController

 #お気に入り機能のアクション
  def create
    @item = Item.find(params[:item_id])
    favorite = @item.favorites.new(teacher_id: current_teacher.id)
    favorite.save
  end

  def destroy
    @item = Item.find(params[:item_id])
    favorite = @item.favorites.find_by(teacher_id: current_teacher.id)
    favorite.destroy
  end
end
