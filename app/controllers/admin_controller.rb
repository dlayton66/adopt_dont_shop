class AdminController < ApplicationController
  def shelters_index
    @shelters = Shelter.find_by_sql("SELECT * FROM shelters ORDER BY name desc")
    @shelters_pending_apps = Shelter.find_shelters_from_application
  end
end 