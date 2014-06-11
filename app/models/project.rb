class Project < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :comments, as: :commentable
  mount_uploader :image, ImageUploader
end
