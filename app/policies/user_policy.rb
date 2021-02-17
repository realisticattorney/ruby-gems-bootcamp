class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def edit?
    @user.has_role?(:admin) or @record.email = @user.email
  end

  def update?
    @user.has_role?(:admin) or @record.email = @user.email
  end
end