class UserSerializer < ActiveModel::Serializer
  attributes :id, :username # :firstname, :lastname
  has_many :posts
  has_many :contents

end
