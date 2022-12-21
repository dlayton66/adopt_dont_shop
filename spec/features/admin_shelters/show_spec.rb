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
    it 'has a section for statistics' do
      visit "/admin/shelters/#{@shelter_1.id}"

      within("#stats") do
        expect(page).to have_content(@shelter_1.average_pet_age)
      end
    end
  end
end