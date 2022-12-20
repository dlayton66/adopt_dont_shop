require 'rails_helper'
require 'test_helper'

RSpec.describe Application, type: :model do
  before :each do
    seed_shelters
    seed_applications
  end

  describe "relationships" do
    it { should have_many :application_pets }
    it { should have_many(:pets).through(:application_pets) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:street_address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip_code) }
    it { should validate_numericality_of(:zip_code) }
  end

  describe "#full_address" do
    it 'can create a full address' do
      expect(@application_1.full_address).to eq("123 Leaf Street, Denver, CO 80020")
    end
  end
  
  describe "attribute status" do
    it 'can show a default status' do
      expect(@application_1.status).to eq('In Progress')
    end
  end

  describe "#has_pets?" do
    it 'tells if an application has pets' do
      expect(@application_1.has_pets?).to be false

      @application_1.pets.create!(
        name: "Pepper",
        adoptable: true,
        age: 4,
        breed: "Pitbull",
        shelter_id: @shelter_1.id
      )
      
      expect(@application_1.has_pets?).to be true
    end
  end

  describe "#update_status" do
    it 'checks to see if application can be approved or rejected' do
      seed_pets
      seed_application_pets

      @application_2.update_status
      expect(@application_2.status).to eq("Pending")

      # Application 2 Pets
      @application_pet_3.update(status: "Approved")
      @application_pet_5.update(status: "Approved")
      # Application 3 Pets
      @application_pet_4.update(status: "Approved")
      @application_pet_6.update(status: "Rejected")

      @application_2.update_status
      @application_3.update_status

      expect(@application_2.status).to eq("Approved")
      expect(@application_3.status).to eq("Rejected")
    end
  end
end 