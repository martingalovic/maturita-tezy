class SessionsController < ApplicationController
  def login
    if student_signed_in?
      redirect_back fallback_location: root_path, flash: { info: "uz si prihlaseny" }
    end

    student = Student.find_by_pin(params[:pin])
    if student && student.verified?
      student_login(student.id)
      redirect_back fallback_location: documents_path, flash: { success: "dobre, stahuj, uc sa" }
    elsif student && student.verified? == false
      redirect_back fallback_location: documents_path, flash: { info: "chvilku pockaj kym overime ci si picovinu neposlal" }
    else
      redirect_to documents_path, flash: { danger: "nedobry pin" }
    end

  end

  def logout
    student_logout
    redirect_to documents_path, flash: { success: "BB" }
  end
end