class PostSerializer < ActiveModel::Serializer
  attributes :id, :image
  has_many :contents
  belongs_to :user
end
