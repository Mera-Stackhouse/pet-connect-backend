class User < ApplicationRecord
  has_many :pets_users, dependent: :destroy
  has_many :events_users, dependent: :destroy

  has_many :pets, through: :pets_users
  has_many :events, through: :events_users

  #many to many user relationships through follower_id and followed_id
  has_many :active_relationships, class_name: "UserRelationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "UserRelationship", foreign_key: "followed_id", dependent: :destroy

  has_many :followed_users, through: :active_relationships, source: :followed_user
  has_many :follower_users, through: :passive_relationships, source: :follower_user



  # def self.from_omniauth(auth)
  #   # Creates a new user only if it doesn't exist
  #   where(email: auth.info.email).first_or_initialize do |user|
  #     user.name = auth.info.name
  #     user.email = auth.info.email
  #   end
  # end


  scope :alphabetical, -> { order(name: :asc, id: :asc) }
  default_scope {alphabetical}

end
