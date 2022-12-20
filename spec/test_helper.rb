def seed_all
  seed_shelters
  seed_applications
  seed_pets
  seed_application_pets
end

def seed_shelters
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
end

def seed_applications
  @application_1 = Application.create!(
    name: "Bob",
    street_address: "123 Leaf Street",
    city: "Denver",
    state: "CO",
    zip_code: 80020,
    # description: "Work from home",
    status: "In Progress"
  )
  
  @application_2 = Application.create!(
    name: "Tom",
    street_address: "508 Maple Street",
    city: "Denver",
    state: "CO",
    zip_code: 80020,
    description: "Love animals",
    status: "Pending"
  )

  @application_3 = Application.create!(
    name: "Sam",
    street_address: "8591 Pine Street",
    city: "Denver",
    state: "CO",
    zip_code: 80021,
    description: "Have a large yard for a furbaby",
    status: "Pending"
  )

  @application_4 = Application.create!(
    name: "Susan",
    street_address: "2210 Palm Street",
    city: "Denver",
    state: "CO",
    zip_code: 80240,
    # description: "Looking for a running  buddy",
    status: "In Progress"
  )
end

def seed_pets
  @pet_1 = Pet.create!(
    name: "Pepper",
    adoptable: true,
    age: 4,
    breed: "Pitbull",
    shelter_id: @shelter_1.id
  )
    
  @pet_2 = Pet.create!(
    name: "Daisy",
    adoptable: true,
    age: 14,
    breed: "Beagle",
    shelter_id: @shelter_1.id
  )

  @pet_3 = Pet.create!(
    name: "Pumba", 
    adoptable: true, 
    age: 7, 
    breed: "Corgi", 
    shelter_id: @shelter_2.id
  )

  @pet_4 = Pet.create!( 
    name: "Timon", 
    adoptable: true, 
    age: 7, 
    breed: "Dacshund", 
    shelter_id: @shelter_3.id
  )

  @pet_5 = Pet.create!(
    name: "Pepperoni",
    adoptable: true,
    age: 2,
    breed: "Corgi",
    shelter_id: @shelter_1.id
  )

  @pet_6 = Pet.create!(
    name: "Lemonpop",
    adoptable: true,
    age: 1,
    breed: "Golden",
    shelter_id: @shelter_2.id
  )

  def seed_application_pets
    @application_pet_1 = ApplicationPet.create!(
      application: @application_1, 
      pet:@pet_1
    )
    
    @application_pet_2 = ApplicationPet.create!(
      application: @application_1, 
      pet: @pet_2
    )

    @application_pet_3 = ApplicationPet.create!(
      application: @application_2, 
      pet: @pet_3
    )

    @application_pet_4 = ApplicationPet.create!(
      application: @application_3, 
      pet: @pet_4
    )

    @application_pet_5 = ApplicationPet.create!(
      application: @application_2, 
      pet: @pet_5
    )

    @application_pet_6 = ApplicationPet.create!(
      application: @application_3, 
      pet: @pet_6
    )
  end
end