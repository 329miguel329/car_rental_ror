class Contract < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :passenger

  # Validations
  validates :user_id, :presence => true
  validates :passenger_id, :presence => true
  validates :minute_time, :presence => true, numericality: true
  validates :distance, :presence => true, numericality: true
  validates :price, :presence => true, numericality: true
  validates :origin, :presence => true
  validates :destination, :presence => true

end
