class Document < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :student
  belongs_to :checker, class_name: "Student", optional: true

  mount_uploader :file, Document::FileUploader
end
