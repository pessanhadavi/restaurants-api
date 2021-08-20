class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # Only restaurants owners can update it
    record.user == user
  end

  def create?
    # Any logged in user can create a restaurant instance
    !user.nil?
  end
end
