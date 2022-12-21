require 'rails_helper'
require 'test_helper'

RSpec.describe 'pet show page' do
  it "shows the pet and all it's attributes" do
    shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    pet = Pet.create(name: 'Scooby', age: 2, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)

    visit "/pets/#{pet.id}"

    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.age)
    expect(page).to have_content(pet.adoptable)
    expect(page).to have_content(pet.breed)
    expect(page).to have_content(pet.shelter_name)
  end

  it "allows the user to delete a pet" do
    shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    pet = Pet.create(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)

    visit "/pets/#{pet.id}"

    click_on("Delete")

    expect(page).to have_current_path('/pets')
    expect(page).to_not have_content(pet.name)
  end

  describe "User Story 17" do
    it 'sets adoptable to false if all pets are approved' do
      seed_all

      visit "/admin/applications/#{@application_2.id}"

      expect(page).to have_content("Application status: Pending")

      within("#pet-#{@pet_3.id}") do
        click_button('Approve')
      end

      within("#pet-#{@pet_5.id}") do
        click_button('Approve')
      end

      visit "/pets/#{@pet_3.id}"

      expect(page).to have_content("Adoptable: false")

      visit "/pets/#{@pet_5.id}"

      expect(page).to have_content("Adoptable: false")
    end

  end
end
