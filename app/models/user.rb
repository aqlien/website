class User < ActiveRecord::Base
  has_many :posts, foreign_key: "author_id"
  after_initialize :set_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.role.downcase == "admin" || self.role.downcase == "administrator"
  end

  def author?
    self.role.downcase == "author"
  end

private
  def set_default_role
    self.role ||= "visitor"
  end
end
