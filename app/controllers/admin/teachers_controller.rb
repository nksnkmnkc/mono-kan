class Admin::TeachersController < ApplicationController

  def index
    @teachers = Teacher.page(params[:page]).per(10)
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
   @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      flash[:notice] = "アカウント情報を更新しました"
      redirect_to admin_teacher_path(@teacher.id)
    else
      render :edit
    end
  end


  private
    def teacher_params
     params.require(:teacher).permit(:name,:grade,:subject,:club,:another,:email,:is_deleted)
    end
end
