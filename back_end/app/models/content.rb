class Content < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :user

  # validates :body, allow_blank: false

end
