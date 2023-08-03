class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def initialize(user, scope)
      @user  = user
      @teams = user.worker.teams
      @scope = scope
    end

    def resolve
      find_projects(@teams)
    end

    private

    def find_projects(teams)
      current_projects = []
      teams.each { |team| team.projects.each { |project| current_projects << project } }
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
