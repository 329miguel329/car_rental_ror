class Contract < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :passenger

  # Validations
  validates :user_id, :presence => true
  validates :passenger_id, :presence => true
  validates :minute_time, :presence => true
  validates :distance, :presence => true
  validates :price, :presence => true
  validates :origin, :presence => true
  validates :destination, :presence => true
end
