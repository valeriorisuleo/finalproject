class Post < ApplicationRecord
  belongs_to :user
  has_many :contents, dependent: :destroy
  # This tells Rails that the image property is more than just a string, but should be treated as a file that is stored on AWS.
  mount_uploader :image, ImageUploader
end
