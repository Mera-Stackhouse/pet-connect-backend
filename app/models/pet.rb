class Pet < ApplicationRecord
  has_many :pets_users
  has_many :events_pets

  has_many :events, through: :events_pets
  has_many :users, through: :pets_users
end
