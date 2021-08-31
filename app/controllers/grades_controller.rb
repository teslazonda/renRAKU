class GradesController < ApplicationController
  def index
    @user = current_user
    @grades = policy_scope(Grade)
  end

  def new
    @grades = Grade.new
    authorize @grades
  end

  def create
    @grade = Grade.new(grade_params)
    @user = current_user
    @grades = policy_scope(Grade)
    authorize @grades

    if @grade.save
      redirect_to student_grades_path(@student)
    else
      render '/grades/new'
    end
  end

  private

  def find_student
    @student = Student.find(params[:student_id])
  end

  def message_params
    params.require(:grade).permit(:date, :subject, :name, :value, :student_id)
  end
end
