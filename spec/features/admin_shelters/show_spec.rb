require 'rails_helper'
require 'test_helper'

RSpec.describe "admin shelter show page" do
  before :each do
    seed_all
  end

  describe "User Story 19" do
    it 'shows the shelter name and full address' do
    #       19. Admin Shelters Show Page

    # As a visitor
    # When I visit an admin shelter show page
    # Then I see that shelter's name and full address

    visit "/admin/shelters/#{@shelter_1.id}"

    

    end
  end
end