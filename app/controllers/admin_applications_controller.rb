class AdminApplicationsController < ApplicationController
  def show
    @application = Application.find(admin_app_params[:id])
    @application_pets = @application.pets
  end

  def update
    application_pet = ApplicationPet.find_by(pet_id: admin_app_params[:pet_id], application_id: admin_app_params[:id])
    application_pet.update(status: admin_app_params[:status])

    application = Application.find(admin_app_params[:id])

    redirect_to "/admin/applications/#{application_pet.application.id}"
  end

  private
  def admin_app_params
    params.permit(:id, :pet_id, :status)
  end
end
