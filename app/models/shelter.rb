class Shelter < ApplicationRecord
  validates :name, presence: true
  validates :rank, presence: true, numericality: true
  validates :full_address, presence: true
  has_many :pets, dependent: :destroy
  has_many :application_pets, through: :pets
  has_many :applications, through: :application_pets

  def self.order_by_recently_created
    order(created_at: :desc)
  end

  def self.order_by_number_of_pets
    select("shelters.*, count(pets.id) AS pets_count")
      .joins("LEFT OUTER JOIN pets ON pets.shelter_id = shelters.id")
      .group("shelters.id")
      .order("pets_count DESC")
  end

  def pet_count
    pets.count
  end

  def adoptable_pets
    pets.where(adoptable: true)
  end

  def adopted_pets
    pets.joins(:applications).where("applications.status = 'Approved'")
  end

  def alphabetical_pets
    adoptable_pets.order(name: :asc)
  end

  def shelter_pets_filtered_by_age(age_filter)
    adoptable_pets.where('age >= ?', age_filter)
  end

  def self.find_shelters_with_pending
    joins(pets: :applications).where("applications.status = 'Pending'").distinct.order(:name)
  end

  def average_pet_age
    pets.average(:age)
  end
end
