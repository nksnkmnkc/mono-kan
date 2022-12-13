class Teachers::SessionsController < Devise::SessionsController

  def guest_sign_in
    teacher = Teacher.guest
    sign_in teacher
    redirect_to teachers_my_page_path, notice: 'ゲストでログインしました。'
  end
end