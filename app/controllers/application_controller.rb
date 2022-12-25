class ApplicationController < ActionController::Base
  before_action :search

  def search
   if params[:keyword]
    @items = Item.where('name like ?',"%#{params[:keyword]}%")
   else
    @items = Item.all.order(created_at: :desc)
   end
   @items = @items.page(params[:page]).per(8)
  end

 #before_action :configure_permitted_parameters, if: :devise_controller?

  #protected

  #def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:grade,:subject,:club,:another,:email])
  #end
end