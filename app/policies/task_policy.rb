class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def complete?
    true
  end

  def uncomplete?
    true
  end

  def show?
    true
  end
end
