require 'rails_helper'
require 'test_helper'

# As a visitor
# When I visit the admin shelter index ('/admin/shelters')
# Then I see all Shelters in the system listed in reverse alphabetical order by name

RSpec.describe "Admin Shelters Index" do
  describe "User Story 10" do
    it 'shows all Shelters listed in reverse alphabetical order' do
      seed_shelters
      visit '/admin/shelters'
      
      expect("Ruff Day").to appear_before("Healthy Paws")
      expect("Healthy Paws").to appear_before("AAA Shelter")
    end
  end
end