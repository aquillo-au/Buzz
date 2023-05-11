class TeamsController < ApplicationController
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
    @membership.user = current_user
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

  private

  def team_params
    params.require(:team).permit(:name, :location)
  end
end
