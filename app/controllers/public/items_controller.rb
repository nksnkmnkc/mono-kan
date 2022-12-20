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
    @utilization_item = Utilization.new
    @genres = Genre.all
  end


  def searches
    @genres = Genre.all
    @search_genre = params[:genre]
    @items_all = Genre.search_for(@search_genre)
    @items = Kaminari.paginate_array(Genre.search_for(@search_genre)).page(params[:page]).per(8)
  end


  def search_word
    @genres = Genre.all
  end



  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :memo, :start_time)
  end

end
