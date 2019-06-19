class User < ApplicationRecord
  has_many :pets_users, dependent: :destroy
  has_many :events_users, dependent: :destroy

  has_many :pets, through: :pets_users
  has_many :events, through: :events_users


  # def self.from_omniauth(auth)
  #   # Creates a new user only if it doesn't exist
  #   where(email: auth.info.email).first_or_initialize do |user|
  #     user.name = auth.info.name
  #     user.email = auth.info.email
  #   end
  # end


end
