class UserPolicy < ApplicationPolicy
  def show?
    super || model == current_user
  end
end
