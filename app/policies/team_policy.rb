class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.worker.teams
    end
  end

  def create?
    true
  end
end
