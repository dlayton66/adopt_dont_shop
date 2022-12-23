require 'rails_helper'
require 'test_helper'

RSpec.describe 'pet show page' do
  before :each do
    seed_all
  end

  it "shows the pet and all it's attributes" do
    visit "/pets/#{@pet_1.id}"

    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_1.age)
    expect(page).to have_content(@pet_1.adoptable)
    expect(page).to have_content(@pet_1.breed)
    expect(page).to have_content(@pet_1.shelter_name)
  end

  it "allows the user to delete a pet" do
    visit "/pets/#{@pet_1.id}"

    click_on("Delete")

    expect(page).to have_current_path('/pets')
    expect(page).to_not have_selector("#pet-#{@pet_1.id}")
  end

  describe "User Story 17" do
    it 'sets adoptable to false if all pets are approved' do
      visit "/admin/applications/#{@application_2.id}"

      expect(page).to have_content("Application status: Pending")

      within("#pet-#{@pet_1.id}") do
        click_button('Approve')
      end

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
