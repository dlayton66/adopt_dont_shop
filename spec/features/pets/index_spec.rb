require 'rails_helper'

RSpec.describe 'the pets index' do
  before :each do
    @shelter = Shelter.create(name: 'Aurora shelter', full_address: 'Aurora, CO', foster_program: false, rank: 9) 

    @pet_1 = Pet.create(adoptable: true, age: 7, breed: 'sphynx', name: 'Bare-y Manilow', shelter_id: @shelter.id)
    @pet_2 = Pet.create(adoptable: true, age: 3, breed: 'domestic pig', name: 'Babe', shelter_id: @shelter.id)
    @pet_3 = Pet.create(adoptable: false, age: 4, breed: 'chihuahua', name: 'Elle', shelter_id: @shelter.id)
  end

  it 'lists all the pets with their attributes' do
    visit "/pets"

    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_1.breed)
    expect(page).to have_content(@pet_1.age)
    expect(page).to have_content(@shelter.name)

    expect(page).to have_content(@pet_2.name)
    expect(page).to have_content(@pet_2.breed)
    expect(page).to have_content(@pet_2.age)
    expect(page).to have_content(@shelter.name)
  end

  it 'only lists adoptable pets' do
    visit "/pets"

    expect(page).to_not have_content(@pet_3.name)
  end

  it 'displays a link to edit each pet' do
    visit '/pets'

    within("#pet-#{@pet_1.id}") do
      expect(page).to have_button("Edit")
    end
    within("#pet-#{@pet_2.id}") do
      expect(page).to have_button("Edit")
      click_button("Edit")
    end

    expect(page).to have_current_path("/pets/#{@pet_2.id}/edit")
  end

  it 'displays a link to delete each pet' do
    visit '/pets'

    within("#pet-#{@pet_1.id}") do
      expect(page).to have_button("Delete")
    end
    within("#pet-#{@pet_2.id}") do
      expect(page).to have_button("Delete")
      click_button("Delete")
    end

    expect(page).to have_current_path("/pets")
    expect(page).to_not have_content(@pet_2.name)
  end

  it 'has a text box to filter results by keyword' do
    visit "/pets"

    expect(page).to have_button("Search")
  end

  it 'lists partial matches as search results' do
    visit "/pets"

    fill_in(:search, with: "Ba")
    click_on("Search")

    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_2.name)
    expect(page).to_not have_content(@pet_3.name)
  end
  
describe 'User story 2' do  
  it 'has a link to start an application' do
      visit '/pets'

      expect(page).to have_link('Start an Application', href: '/applications/new')

      click_link 'Start an Application'

      expect(current_path).to eq('/applications/new')
    end
  end
end

