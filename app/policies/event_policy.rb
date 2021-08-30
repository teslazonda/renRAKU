class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      user.teacher?
    end

    def show?
    end

    def update?
      user.teacher?
    end

    def edit?
      user.teacher?
    end

    def destroy?
      user.teacher?
    end
  end
end
