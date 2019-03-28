class StudentsController < ApplicationController
  before_action :set_student
  before_action :authenticate_student!

  def destroy
    if @student.destroy
      redirect_to documents_path, flash: { success: "deleted #{@student.name}" }
    else
      redirect_to documents_path, flash: { danger: "not deleted #{@student.name}" }
    end
  end

  private

  def set_student
    @student = Student.find_by(id: params[:id])
  end
end