class GradesController < ApplicationController
  add_breadcrumb "Dashboard", :dashboards_path
  add_breadcrumb "Classes", :kurasus_path
  add_breadcrumb "Grades", :student_grades_path
  def index
    @user = current_user
    @student = Student.find(params[:student_id])
    # Using separate variables to iterate over for each subject
    @english_grades = policy_scope(@student.grades.where(subject: 'English'))
    @math_grades = policy_scope(@student.grades.where(subject: 'Math'))
    @socialstudies_grades = policy_scope(@student.grades.where(subject: 'Social Studies'))
    @japanese_grades = policy_scope(@student.grades.where(subject: 'Japanese'))
    @history_grades = policy_scope(@student.grades.where(subject: 'History'))
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
