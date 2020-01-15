class Passenger < ApplicationRecord

  # Validations
  validates :email, :presence => true
  validates :identification, :presence => true, :uniqueness => true
  validates :phone, :presence => true

  # Associations
  has_many :contracts

  def full_name_view
    "<i class='fa fa-user'></i>&nbsp; <b>[#{self.identification}]</b> #{self.email}"
  end

  def self.select2(oParams)
    if oParams.has_key?(:q)
      param_query = "%#{oParams[:q]}%"
      param_query = param_query.downcase
    else
      param_query = "NULL_ERROR";
    end
    select_scope = "id, email, identification, phone"
    where_scope = "lower(email) LIKE ? OR lower(phone) LIKE ? OR lower(identification) LIKE ?", param_query, param_query, param_query
    where(where_scope).select(select_scope)
  end

  def self.get_passenger_by_identification(oParams)
    self.find_by(:identification => oParams["identification"])
  end

  def self.set_data_passenger(oParams)
    oPassenger = self.find_by(:identification => oParams["identification"])
    if oPassenger
      oPassenger.update(oParams)
    else
      oPassenger = self.new(oParams)
      oPassenger.save(oParams)
    end
    oPassenger
  end
end
