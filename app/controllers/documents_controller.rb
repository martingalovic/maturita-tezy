class DocumentsController < ApplicationController
  before_action :authenticate_student!, only: [:download]

  def index
  end

  def new
    @document = Document.new
  end

  def create
    @student = Student.create!(name: document_params[:student], pin: ('%04d' % rand(10 ** 4)))
    @document = Document.create!(student: @student, file: document_params[:file])

    flash[:success] = "Odovzdane, modli sa zeby to nebola picovina, tvoj PIN: <strong>#{@student.pin}</strong>"

    redirect_to documents_path
  end

  private

  def document_params
    params.require(:document).permit(:student, :file)
  end
end
