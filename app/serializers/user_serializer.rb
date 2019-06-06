class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :img_url, :neighborhood, :email, :phone, :bio, :pets, :events
end
