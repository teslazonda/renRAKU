class KurasuPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all if user.teacher?
    end
  end

  def create?
    user.teacher?
  end

  def new?
    user.teacher?
  end

  def update?
    user.teacher?
  end
end
