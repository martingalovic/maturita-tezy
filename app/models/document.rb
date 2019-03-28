class Document < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :student
  belongs_to :checker, {class_name: "Student"}

  mount_uploader :file, Document::FileUploader
end
