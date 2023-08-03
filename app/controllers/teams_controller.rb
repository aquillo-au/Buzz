class TeamsController < ApplicationController
  before_action :find_task, only: %i[add_member]
  def index
    @teams = policy_scope(Team)
  end

  def new
    @team = Team.new
    authorize @team
  end

  def create
    @team = Team.new(team_params)
    @membership = Membership.new
    @membership.worker = current_user.worker
    @membership.team = @team
    @membership.leader = true
    # @project.user_id = current_user.id
    authorize @team
    authorize @membership
    if @team.save && @membership.save
      redirect_to teams_path, notice: 'team was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def add_member

  end

  private

  def find_task
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :location)
  end
end
