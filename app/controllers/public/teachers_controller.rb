class Public::TeachersController < ApplicationController
  before_action :authenticate_teacher!
  before_action :ensure_guest_user, only: [:edit]

  #マイページへのアクション
  def show
    @teacher = current_teacher
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
    @teacher.update(ir_deleted: true)
    reset_session
      flash[:notice] = "アカウントの削除が完了しました"
    redirect_to root_path
  end



  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :grade, :subject, :club, :another, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "ゲスト"
      redirect_to user_path(current_user) , notice: 'ゲストはプロフィール編集画面へ遷移できません。'
    end
  end

end
