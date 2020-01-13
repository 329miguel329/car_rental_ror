class BloodType < ApplicationRecord
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
    puts "///////////////////////////////////////////"
    puts oParams
    puts "///////////////////////////////////////////"
    if oParams.has_key?(:q)
      param_query = "%#{oParams[:q]}%"
      param_query = param_query.downcase
    else
      param_query = "NULL_ERROR";
    end
    select_scope = "id, code, name"
    where_scope = "lower(code) like ? or lower(name) like ?", param_query, param_query
    where(where_scope).select(select_scope)
  end
end
