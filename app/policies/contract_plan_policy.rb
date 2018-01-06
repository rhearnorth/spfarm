class ContractPlanPolicy < ApplicationPolicy
  def index?
    current_user.present?
  end

  def show?
    current_user.present?
  end
end
