class Public::TeachersController < ApplicationController
  before_action :authenticate_teacher!
  #ログインティーチャーの情報のみ編集可能
  before_action :ensure_guest_teacher, only: [:edit]

  #マイページへのアクション
  def show
    @teacher = current_teacher
    @utilizations  = current_teacher.utilizations.page(params[:page]).per(5)
    item_ids = current_teacher.favorites.pluck(:item_id)
    @favorite_items = Item.where(id: item_ids).page(params[:page]).per(5)
  end

  #登録情報編集へのアクション
  def edit
    @teacher = current_teacher
  end

  #登録情報の編集を保存するアクション
  def update
    @teacher = current_teacher
    if @teacher.update(teacher_params)
      flash[:notice] = "登録情報の変更が完了しました"
      redirect_to teachers_my_page_path
    else
      flash[:notice] = "登録情報の変更に失敗しました"
      render "edit"
    end
  end

  #退会アクション
  def is_deleted
    @teacher = current_teacher
    #is_deletedカラムにフラグを立てる（defaultはfalse)
    @teacher.update(is_deleted: true)
    reset_session
      flash[:notice] = "アカウントの削除が完了しました"
    redirect_to root_path
  end



  private

  def teacher_params
    params.require(:teacher).permit(:name, :grade, :subject, :club, :another, :profile_image)
  end

  def ensure_guest_teacher
    @teacher = current_teacher
    if @teacher.name == "ゲスト"
      redirect_to teachers_my_page_path(current_teacher) , notice: 'ゲストはプロフィール編集・削除はできません。'
    end
  end

  def item_params
    params.require(:item).permit(:genre_id, :name, :memo, :image)
  end

end