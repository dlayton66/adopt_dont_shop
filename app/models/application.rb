class Application < ApplicationRecord
  has_many :application_pets
  has_many :pets, through: :application_pets
  attribute :status, :string, default: 'In Progress'
  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :description, presence: true

  def full_address 
    "#{street_address}, #{city}, #{state} #{zip_code}"
  end
end