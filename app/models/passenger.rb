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
end
