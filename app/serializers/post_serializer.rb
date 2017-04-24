class PostSerializer < ActiveModel::Serializer
  attributes :id, :image_src
  has_many :contents
  belongs_to :user

  def image_src
    object.image.url
  end
end
