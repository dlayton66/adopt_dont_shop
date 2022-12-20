class Application < ApplicationRecord
  has_many :application_pets, dependent: :destroy
  has_many :pets, through: :application_pets
  attribute :status, :string, default: 'In Progress'
  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, numericality: true

  STATUS = ['In Progress', 'Pending', 'Approved', 'Rejected'].freeze
 
  def full_address 
    "#{street_address}, #{city}, #{state} #{zip_code}"
  end

  def has_pets?
    !pets.empty?
  end

  def update_status
    return if self.status != "Pending"

    pet_statuses = ApplicationPet.where(application_id: id).pluck(:status).uniq

    return if pet_statuses.include?("Pending")

    if pet_statuses.count == 1 && pet_statuses[0] == "Approved"
      self.status = "Approved"
    elsif pet_statuses.include?("Rejected")
      self.status = "Rejected"
    end
  end
end