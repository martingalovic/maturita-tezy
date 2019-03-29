class StatusPresenter
  def pending_names
    Student.pending_names
  end

  def all_names
    Student::AVAILABLE_STUDENTS
  end

  def sent_names
    Student.all.pluck(&:name)
  end

  def progress_width
    # 188 --- available
    # x ----- pending
    (100 - (100 * pending_names.size / all_names.size)).round(5)
  end
end