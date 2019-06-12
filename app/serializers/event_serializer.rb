class EventSerializer < ActiveModel::Serializer
  attributes :id, :event_type, :location, :start_time, :users, :pets
end
