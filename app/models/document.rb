class Document < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :student

  mount_uploader :file, Document::FileUploader
end
