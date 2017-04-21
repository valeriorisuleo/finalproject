class ContentSerializer < ActiveModel::Serializer
  attributes :id, :body, :language, :title
  belongs_to :post
  belongs_to :user
end
