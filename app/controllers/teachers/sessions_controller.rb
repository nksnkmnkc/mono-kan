class Teachers::SessionsController < Devise::SessionsController

  def guest_sign_in
    teacher = Teacher.guest
    sign_in teacher
    redirect_to teachers_my_page_path(current_teacher.id)
    flash[:notice] = "ゲストでログインしました。"
  end
end