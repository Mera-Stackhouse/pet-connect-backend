class Event < ApplicationRecord
  has_many :events_pets, dependent: :destroy
  has_many :events_users, dependent: :destroy

  has_many :users, through: :events_users
  has_many :pets, through: :events_pets
end
