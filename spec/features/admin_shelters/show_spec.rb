require 'rails_helper'
require 'test_helper'

RSpec.describe "admin shelter show page" do
  before :each do
    seed_all
  end

  describe "User Story 19" do
    it 'shows the shelter name and full address' do
      visit "/admin/shelters/#{@shelter_1.id}"

      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_1.full_address)
    end
  end

  describe "User Story 22" do
    it 'has a section for statistics and average pet age' do
      visit "/admin/shelters/#{@shelter_1.id}"

      within("#stats") do
        expect(page).to have_content(@shelter_1.average_pet_age.round(2))
      end
    end
  end

  describe "User Story 23" do
    it 'has a statistic for adoptable number of pets' do
      visit "/admin/shelters/#{@shelter_1.id}"

      within("#stats") do
        expect(page).to have_content(@shelter_1.adoptable_pets.count)
      end
    end
  end

  describe "User Story 24" do
    it 'has a statistic for number of pets adopted' do
      visit "/admin/shelters/#{@shelter_1.id}"

      within("#stats") do
        expect(page).to have_content(@shelter_1.adopted_pets.count)
      end

      visit "/admin/shelters/#{@shelter_2.id}"

      within("#stats") do
        expect(page).to have_content(@shelter_2.adopted_pets.count)
      end

      visit "/admin/shelters/#{@shelter_3.id}"

      within("#stats") do
        expect(page).to have_content(@shelter_3.adopted_pets.count)
      end
    end
  end

  describe "User Story 25" do
    it 'lists all pets at shelter with pending status' do
      visit "/admin/shelters/#{@shelter_1.id}"

      within("#action_required") do
        expect(page).to have_content("Action Required")
        @shelter_1.pending_pets.each do |pet|
          expect(page).to have_content(pet.name)
        end
      end
    end
  end

  describe "User Story 26" do
    it 'has link to admin application page for pending pets' do
      visit "/admin/shelters/#{@shelter_1.id}"

      within('#action_required') do
        expect(page).to have_link('Bob', href: "/admin/applications/#{@application_1.id}")
        expect(page).to have_link('Tom', href: "/admin/applications/#{@application_2.id}")
      end
    end
  end
end