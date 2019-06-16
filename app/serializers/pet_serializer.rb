class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :img_url, :users_ids

  def users_ids
    object.users.collect{|u| u.id}
  end
end
