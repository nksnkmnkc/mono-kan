class ApplicationController < ActionController::Base
  before_action :search


  def search
   #@q = Item.ransack(params[:q])
   #@item = @q.result(distinct: true)
   if params[:keyword]
    @items = Item.where('name like ?',"%#{params[:keyword]}%")
   else 
    @items = Item.all 
   end
   @items = @items.page(params[:page]).per(8)
  end


# params[:q]のqには検索フォームに入力した値が入る
#   ransackメソッドは検索ヘルパーメソッドである
# resultメソッドは検索結果を返すヘルパーメソッドである
# distinct: trueは、重複する検索結果を除外する役割を持つ


 #before_action :configure_permitted_parameters, if: :devise_controller?

  #protected

  #def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:grade,:subject,:club,:another,:email])
  #end
end
