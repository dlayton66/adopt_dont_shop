# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ApplicationPet.destroy_all
Pet.destroy_all
Application.destroy_all
Shelter.destroy_all

@shelter_1 = Shelter.create!(
  foster_program: true,
  name: "Healthy Paws",
  city: "Denver",
  rank: 3
)

@shelter_2 = Shelter.create!(
  foster_program: true,
  name: "Ruff Day",
  city: "Detroit",
  rank: 2
)

@shelter_3 = Shelter.create!(
  foster_program: true,
  name: "AAA Shelter",
  city: "Houston",
  rank: 1
)

@application_1 = Application.create!(
  name: "Bob",
  street_address: "123 Leaf Street",
  city: "Denver",
  state: "CO",
  zip_code: 80020,
  description: "Work from home",
  status: "In Progress"
)

@pet_1 = @application_1.pets.create!(
  name: "Pepper",
  adoptable: true,
  age: 4,
  breed: "Pitbull",
  shelter_id: @shelter_1.id
)
  
@pet_2 = @application_1.pets.create!(
  name: "Daisy",
  adoptable: true,
  age: 14,
  breed: "Beagle",
  shelter_id: @shelter_1.id
)