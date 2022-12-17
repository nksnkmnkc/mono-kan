class Admin::HomesController < ApplicationController
 before_action :authenticate_admin!

 def top
  @utilizations = Utilization.page(params[:page])
 end

end
