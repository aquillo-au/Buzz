class ProjectsController < ApplicationController
  before_action :find_project, only: %i[show assign_team]
  before_action :find_assigned, only: %i[show]
  def index
    @projects = policy_scope(Project)
  end

  def show
    @available = check_available
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def assign_team
    team = Team.find(params[:team])
    appointment = Appointment.new
    appointment.team = team
    appointment.project = @project
    authorize @project
    if appointment.save
      redirect_to project_path(@project), notice: 'Team was successfully assigned.'
    else
      render :show, status: :unprocessable_entity, notice: 'that team is already assigned'
    end
  end

  def create
    @project = Project.new(project_params)
    # @project.user_id = current_user.id
    @project.worker = current_user.worker
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

  def find_assigned
    teams = []
    @project.appointments.each do |appointment|
      teams << appointment.team
    end
    @assigned = teams.flatten
  end

  def check_available
    teams = []
    current_user.worker.teams.each do |team|
      check = false
      team.memberships.each do |member|
        check = true if member.leader? && member.worker == current_user.worker
      end
      teams << team if check == true && @assigned.exclude?(team)
    end
    teams
  end
end
