class Admin::UtilizationsController < ApplicationController
  before_action :authenticate_admin!

 #使用報告一覧へのアクション
  def index
    @utilizations = Utilization.all
  end

end
