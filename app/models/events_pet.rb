class EventsPet < ApplicationRecord
  belongs_to :event
  belongs_to :pet
end
