require 'rails_helper'
require 'test_helper'

RSpec.describe "Admin Shelters Index" do
  before :each do
    seed_all
  end

  describe "User Story 10" do
    it 'shows all Shelters listed in reverse alphabetical order' do
      visit '/admin/shelters'
      
      expect("Ruff Day").to appear_before("Healthy Paws")
      expect("Healthy Paws").to appear_before("AAA Shelter")
    end
  end
  
  describe "User Story 11" do
    it 'has a section for shelters with pending applications' do
      visit '/admin/shelters'

      expect(page).to have_content("Shelters with Pending Applications")
    end

    it 'will show the name of every shelter that has pending applications' do
      visit '/admin/shelters'

      within("#pending") do 
        expect(page).to have_content(@shelter_2.name)
        expect(page).to have_content(@shelter_3.name)
      end
      
      expect(current_path).to eq('/admin/shelters')
    end
  end

  describe "User Story 20" do
    it 'shows shelters with pending applicaitons alphabetically' do
      visit "/admin/shelters"

      within("#pending") do
        expect(@shelter_3.name).to appear_before(@shelter_1.name)
        expect(@shelter_1.name).to appear_before(@shelter_2.name)
      end
    end
  end
end