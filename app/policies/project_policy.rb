class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def initialize(user, scope)
      @user  = user
      @teams = user.teams
      @team_projects = find_projects(@teams)
      @scope = scope
    end

    def resolve
      @team_projects
    end

    private

    def find_projects(teams)
      current_projects = []
      teams.map { |team| team.projects.map { |project| current_projects << project } }
      current_projects
    end
  end

  def index?
    true
  end

  def assign_team?
    true
  end

  def create?
    true
  end

  def show?
    true
  end
end
