class SchedulePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def show?
    end

    def update?
      user.teacher?
    end

    def edit?
      user.teacher?
    end

    def new?
      user.teacher?
    end
end
