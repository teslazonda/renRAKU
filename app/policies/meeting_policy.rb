class MeetingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
  end

  def create?
    user.teacher?
  end

  def update?
    user
  end
end
