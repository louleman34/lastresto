class PreferencesPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    current_buyer?
  end

  def update?
    current_buyer?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  private

  def current_buyer_is_owner?
    @buyer = @record.buyer
  end

end
