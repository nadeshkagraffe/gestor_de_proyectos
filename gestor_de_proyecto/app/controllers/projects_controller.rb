class ProjectsController < ApplicationController
  http_basic_authenticate_with name: 'desafiovamoscontodo', password: 'XAHTJEAS23123%23', only: :dashboard

  def dashboard
    if params[:status].present?
      @project = Project.where('status = ?', params[:status])
    else
      @project = Project.all
    end
  end
  def create
    @project= Project.create(name: params[:name], description: params[:description], start_date: params[:start_date], end_date: params[:end_date], status: params[:status])
  end

  def form
    @project= Project.new()
  end
end
