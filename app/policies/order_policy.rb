class OrderPolicy < ApplicationPolicy

  def show?
    super || model.user = current_user
  end

end
