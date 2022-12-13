class Public::ItemsController < ApplicationController
  #before_action :authenticate_admin!

  #消耗品一覧画面へのアクション
  def index
    @items = Item.all
    @genres = Genre.all
  end

  #消耗品詳細画面へのアクション
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end



  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :memo, :start_time)
  end

end
