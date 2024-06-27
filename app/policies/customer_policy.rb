class CustomerPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def show_modal_footer?
    user.admin?
  end

  class Scope < ApplicationPolicy::Scope
  end
end
