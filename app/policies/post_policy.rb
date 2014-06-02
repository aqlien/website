class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      user.present? && user.admin? ? scope.all : scope.where(:published => true)
    end
  end

  def permitted_attributes
    user.admin? ? [:title, :body, :published] : [:title, :body]
  end

  def publish?
    @user.admin?
  end
end
