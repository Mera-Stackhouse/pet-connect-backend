class Event < ApplicationRecord
  has_many :events_pets, dependent: :destroy
  has_many :events_users, dependent: :destroy

  has_many :users, through: :events_users
  has_many :pets, through: :events_pets


  scope :order_by_start_time, -> { order(start_time: :asc, id: :asc) }
  default_scope {order_by_start_time}
end
