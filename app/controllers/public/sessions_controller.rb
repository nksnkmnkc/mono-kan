# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   before_action :teacher_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
   protected
  # 退会しているかを判断するメソッド
    def teacher_state
    ##入力されたemailからアカウントを1件取得
      @teacher = Teacher.find_by(email: params[:teacher][:email])
    ##アカウントを取得できなかった場合、このメソッドを終了する
       return if !@teacher
    ##取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別＋会員ではない（退会した）アカウントなら弾く
       if @teacher.valid_password?(params[:teacher][:password]) && (@teacher.is_deleted == true)
          flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
           redirect_to new_customer_registration_path
       end
    end
end
