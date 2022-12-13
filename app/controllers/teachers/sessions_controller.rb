class Teachers::SessionsController < Devise::SessionsController

  def guest_sign_in
    teacher = Teacher.guest
    sign_in teacher
    redirect_to teacher_session_path(teacher), notice: 'ゲストでログインしました。'
  end
end