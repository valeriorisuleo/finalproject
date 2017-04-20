class User < ApplicationRecord
  has_secure_password validations: false
  has_many :posts
  has_many :contents

  validates :username, presence: true
  validates :email, uniqueness: true, presence: true, unless: :oauth_login?
  validates :password, presence: true, confirmation: true, unless: :oauth_login?, on: :create

  def oauth_login?
     github_id.present?
   end
end
