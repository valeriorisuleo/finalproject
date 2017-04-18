class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :contents

  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
end
