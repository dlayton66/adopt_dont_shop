class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql("SELECT * FROM shelters ORDER BY name desc")
    @shelters_pending_apps = Shelter.find_shelters_with_pending
  end

  def show
    @shelter = Shelter.find_by_sql("SELECT * FROM shelters WHERE id=#{params[:id]}").first
  end
end



