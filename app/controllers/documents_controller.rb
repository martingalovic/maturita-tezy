class DocumentsController < ApplicationController
  before_action :set_document, only: [:download, :check]
  before_action :authenticate_student!, only: [:download]

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @student = Student.create!(name: document_params[:student], pin: ('%05d' % rand(10 ** 5)))
    @document = Document.create!(student: @student, file: document_params[:file])

    flash[:success] = "Odovzdane, modli sa zeby to nebola picovina, tvoj PIN: <strong>#{@student.pin}</strong>"

    redirect_to documents_path
  end

  def download
    redirect_to @document.file.url
  end

  def check
    @document.checked = !@document.checked?
    @document.save!
    redirect_back fallback_location: documents_path, flash: { success: "Overene" }
  end

  private

  def document_params
    params.require(:document).permit(:student, :file)
  end

  def set_document
    @document = Document.find(params[:document_id])
  end
end
