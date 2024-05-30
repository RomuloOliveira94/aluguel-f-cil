class CustomerPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user.admin?
  end

  class Scope < ApplicationPolicy::Scope
  end
end
