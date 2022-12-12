class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
 
  #消耗品登録画面へのアクション
  def new
    @item = Item.new  
    @genres = Genre.all
  end
  
  #消耗品新規登録へのアクション
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "消耗品の登録が完了しました"
      redirect_to admin_item_path(@item.id)
    else
      flash[:danger] = "未入力項目があります"
      @genres = Genre.all
      @item = Item.new(item_params)
      render 'new'
    end
  end
  
  #消耗品一覧画面へのアクション
  def index
    @items = Item.all
    @item = Item
  end
  
  #消耗品詳細画面へのアクション
  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
  end
  
  #消耗品登録情報編集へのアクション
  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  
  #消耗品登録情報の編集を保存するアクション
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    flash[:notice] = "消耗品の編集が完了しました"
    redirect_to admin_item_path(@item.id)
  end
  
  
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :memo, :start_time)
  end
  
end
