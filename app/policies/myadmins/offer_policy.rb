class Myadmins::OfferPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

end


# class PostPolicy < ApplicationPolicy
#   class Scope
#     attr_reader :user, :scope

#     def initialize(user, scope)
#       @user  = user
#       @scope = scope
#     end

#     def resolve
#       if user.admin?
#         scope.all
#       else
#         scope.where(published: true)
#       end
#     end
#   end
