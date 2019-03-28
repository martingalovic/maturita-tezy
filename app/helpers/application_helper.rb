module ApplicationHelper
  def student_signed_in?
    not current_student.nil?
  end

  def current_student
    Student.find_by(id: session[:student_id])
  end

  def authenticate_student!
    return redirect_to documents_path, status: :temporary_redirect, flash: { error: 'nono ty vytržnik' }
  end
end
