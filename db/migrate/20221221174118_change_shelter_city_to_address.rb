class ChangeShelterCityToAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :shelters, :city, :full_address
  end
end
