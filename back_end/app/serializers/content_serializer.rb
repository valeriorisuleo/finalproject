class ContentSerializer < ActiveModel::Serializer
  attributes :id, :body, :language
  belongs_to :post
  belongs_to :user
end
