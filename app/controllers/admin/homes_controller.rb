class Admin::HomesController < ApplicationController
 before_action :authenticate_admin!

 def top
  @utilizations = Utilization.all
 end

end
