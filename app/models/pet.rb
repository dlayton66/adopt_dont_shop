class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  belongs_to :shelter
  has_many :application_pets, dependent: :destroy
  has_many :applications, through: :application_pets

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end

  def application_status(application_id)
    ApplicationPet.find_by(pet_id: self.id, application_id: application_id).status
  end

  def pending_application_pets
    application_pets.where(status: 'Pending')
  end

  def pending_applications
    app_ids = pending_application_pets.select(:application_id)
    applications.where(id: app_ids)
  end
end
