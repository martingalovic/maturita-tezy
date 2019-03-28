class Document < ApplicationRecord
  belongs_to :student

  mount_uploader :file, Document::FileUploader
end
