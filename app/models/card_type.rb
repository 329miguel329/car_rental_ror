class CardType < ApplicationRecord
  # Validations
  validates :code, :presence => true, :uniqueness => true
  validates :name, :presence => true

  # Public methods

  def full_name
    "[#{self.code}] #{self.name}"
  end

  def full_name_view
    "<i class='fa fa-info-circle'></i>&nbsp; <b>#{self.code}</b> #{self.name}"
  end

  def self.select2(oParams)
    if oParams.has_key?(:q)
      param_query = "%#{oParams[:q]}%"
      param_query = param_query.downcase
    else
      param_query = "NULL_ERROR";
    end
    where("lower(code) like ? or lower(name) like ?", param_query, param_query).select("id, code, name")
  end
end
