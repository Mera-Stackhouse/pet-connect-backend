# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#
# User.destroy_all
# Pet.destroy_all
# Event.destroy_all

Faker::Config.locale = 'en-US'

# bios = [
#   "Dog walker and pet sitter",
#   "Looking for pet play dates for my pups",
#   "Pet sitter",
#   "New pet parent",
#   "Dog walker"
# ]
#
# breeds = [
#   "German Shepherd",
#   "Golden Retriever",
#   "French Bulldog",
#   "Beagle",
#   "Poodle",
#   "Rottweilers",
#   "Yorkshire Terrier",
#   "Siberian Huskie",
#   "Dachshund",
#   "Sphynx",
#   "Scottish Fold",
#   "American Shorthair",
#   "Maine Coon",
#   "Persian",
#   "Ragdoll"
# ]
#
# event_types = [
#   'Walk',
#   'Pet Sitting',
#   'Pet Date'
# ]
#
# 5.times do
#   User.create(
#     name: Faker::Name.unique.name,
#     neighborhood: Faker::Address.community + ", " + Faker::Address.city,
#     email: Faker::Internet.email,
#     phone: Faker::PhoneNumber.cell_phone,
#     bio: bios[Faker::Number.within(0..4)],
#     img_url: Faker::Avatar.image
#   )
# end
#
# 8.times do
#   Pet.create(
#     name: Faker::Name.first_name,
#     img_url: Faker::LoremFlickr.image,
#     breed: breeds[Faker::Number.within(0..14)]
#   )
# end
#
# 10.times do
#   Event.create(
#     event_type: event_types[Faker::Number.within(0..2)],
#     location: Faker::Address.full_address,
#     start_time: Faker::Time.forward(30)
#   )
# end


PetsUser.create(user_id: 21, pet_id: 6)
PetsUser.create(user_id: 22, pet_id: 6)
PetsUser.create(user_id: 23, pet_id: 7)
  PetsUser.create(user_id: 23, pet_id: 8)
PetsUser.create(user_id: 24, pet_id: 9)
  PetsUser.create(user_id: 24, pet_id: 10)
  PetsUser.create(user_id: 24, pet_id: 11)
  PetsUser.create(user_id: 24, pet_id: 12)
PetsUser.create(user_id: 25, pet_id: 12)
  PetsUser.create(user_id: 25, pet_id: 13)


EventsUser.create(user_id: 21, event_id: 1)
  EventsUser.create(user_id: 23, event_id: 1)
EventsUser.create(user_id: 24, event_id: 2)
  EventsUser.create(user_id: 25, event_id: 2)
EventsUser.create(user_id: 22, event_id: 3)
  EventsUser.create(user_id: 24, event_id: 3)
EventsUser.create(user_id: 21, event_id: 4)
  EventsUser.create(user_id: 24, event_id: 4)
EventsUser.create(user_id: 21, event_id: 5)
  EventsUser.create(user_id: 25, event_id: 5)
EventsUser.create(user_id: 22, event_id: 6)
  EventsUser.create(user_id: 24, event_id: 6)
EventsUser.create(user_id: 23, event_id: 6)
  EventsUser.create(user_id: 24, event_id: 6)
EventsUser.create(user_id: 25, event_id: 6)
  EventsUser.create(user_id: 24, event_id: 6)



EventsPet.create(pet_id: 6, event_id: 1)
  EventsPet.create(pet_id: 8, event_id: 1)
EventsPet.create(pet_id: 11, event_id: 2)
  EventsPet.create(pet_id: 13, event_id: 2)
EventsPet.create(pet_id: 6, event_id: 3)
  EventsPet.create(pet_id: 9, event_id: 3)
EventsPet.create(pet_id: 6, event_id: 4)
  EventsPet.create(pet_id: 10, event_id: 4)
  EventsPet.create(pet_id: 11, event_id: 4)
EventsPet.create(pet_id: 6, event_id: 5)
  EventsPet.create(pet_id: 12, event_id: 5)
EventsPet.create(pet_id: 13, event_id: 6)
  EventsPet.create(pet_id: 9, event_id: 6)
  EventsPet.create(pet_id: 11, event_id: 6)

# Events 1 - 10
#
# Pets 6 - 13
#
# User 21 - 25
