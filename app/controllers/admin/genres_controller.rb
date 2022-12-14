class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  #ジャンル一覧へのアクション
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  #ジャンルデータ登録アクション
  def create
    @genre = Genre.new(name: genre_params)
    if @genre.save
      flash[:natice] = "ジャンルを登録しました"
      redirect_to request.referer
    else
      @genres = Genre.all
      flash[:notice] = "ジャンル名を入力してください"
      render :index
    end
  end

  #ジャンル編集へのアクション
  def edit
    @genre = Genre.find(params[:id])
  end

  #ジャンル編集を保存するアクション
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(name: genre_params)
      flash[:notice] = "ジャンル名の変更が完了しました"
      redirect_to admin_genres_path
    else
      flash[:notice] = "ジャンル名を入力してください"
      render :edit
    end
  end


  private

  def genre_params
    params.require(:genre)[:name]
  end
end
