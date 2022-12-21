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
end