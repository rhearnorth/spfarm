class OrderPolicy < ApplicationPolicy

  def show?
    super || model.user_id = current_user.id
  end

end
