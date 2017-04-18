class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :image
  has_many :contents
  belongs_to :user
end
