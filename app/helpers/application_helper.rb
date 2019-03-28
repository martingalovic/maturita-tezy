module ApplicationHelper
  def student_signed_in?
    not current_student.nil?
  end

  def current_student
    Student.find_by(id: session[:student_id])
  end

  def authenticate_student!
    return redirect_to documents_path, status: :temporary_redirect, flash: { danger: 'nono ty vytržnik' } unless student_signed_in?
  end

  def student_login(student_id)
    session[:student_id] = student_id
  end

  def student_logout
    session.delete(:student_id)
  end
end
