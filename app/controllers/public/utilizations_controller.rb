class Public::UtilizationsController < ApplicationController

  #使用報告一覧へのアクション
  def index
    @utilizations = current_teacherr.utilizations
  end

  #使用情報確認
  def confirm
    @utilization = Utilization.new(utilization_params)
    @new_utilization = Utilization.new
  end

 #使用確定処理
  def create
    @utilization = current_teacher.utilizations.new(utilization_params)
    @utilization.save!
    redirect_to teachers_my_page_path
  end


  private

  def utilization_params
    params.require(:utilization).permit(:teacher_id, :item_id, :usage_rule, :item_count)
  end
end
