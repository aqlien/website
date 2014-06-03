class ApplicationPolicy
  def initialize(user, record)
    #only allow logged in users to do anything, including view the index/show page
    # raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @user ||= User.new #if no User, set as temporary User
    @record = record
  end
end
