class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      user.present? && user.admin? ? scope.all : scope.where(:published => true)
    end
  end

  def permitted_attributes
    @user.admin? ? [:title, :body, :published] : [:title, :body]
  end

  def new?
    @user.author? || @user.admin?
  end

  def create?
    @user.new?
  end

  def publish?
    @user.admin?
  end

  def edit?
    @user.admin? || (@user.author? && @user.id == @post.author_id)
  end

  def update?
    @user.edit?
  end

  def destroy?
    @user.admin?
  end

end
