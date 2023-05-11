class ProjectsController < ApplicationController
  before_action :find_project, only: %i[show assign_team]
  def index
    @projects = policy_scope(Project)
  end

  def show
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def assign_team
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    # @project.user_id = current_user.id
    @project.user = current_user
    authorize @project
    if @project.save
      redirect_to projects_path, notice: 'project was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
