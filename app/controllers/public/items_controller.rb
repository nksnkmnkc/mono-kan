class Public::ItemsController < ApplicationController
  #before_action :authenticate_admin!

  #消耗品一覧画面へのアクション
  def index
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
  end

  #消耗品詳細画面へのアクション
  def show
    @item = Item.find(params[:id])
    @utilization_item = Utilization.new
    @genres = Genre.all
  end


  def searches
    @genres = Genre.all
    @search_genre = params[:genre]
    @items_all = Genre.find(params[:genre_id]).items
    @items = @items_all.page(params[:page]).per(8)
  end


  def search_word
    @genres = Genre.all
    @search_word = params[:keyword]
  end


  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :memo, :start_time)
  end

end
