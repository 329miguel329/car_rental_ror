class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  # Associations
  belongs_to :blood_type
  belongs_to :card_type
  # Validations
  validates :email, :presence => true, :uniqueness => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :blood_type_id, :presence => true
  validates :card_type_id, :presence => true
  validates :identification, :presence => true, :uniqueness => true
  validates :rol, :presence => true
  validates_presence_of :property_card, :if => :is_driver?
  validates_uniqueness_of :property_card, :if => :is_driver?
  validates_presence_of :license, :if => :is_driver?
  validates_uniqueness_of :license, :if => :is_driver?
  validates_presence_of :phone, :if => :is_driver?
  validates_uniqueness_of :phone, :if => :is_driver?
  validates_presence_of :address, :if => :is_driver?
  validates_uniqueness_of :address, :if => :is_driver?

  before_validation :set_password

  # Public Methods
  def set_password
    if self.new_record?
      self.password = self.identification
      self.password_confirmation = self.identification
    end
    unless self.is_driver?
      self.property_card = ""
      self.license = ""
      self.phone = ""
      self.address = ""
    end
  end

  def is_driver?
    self.rol == CarRental::ROL_DRIVER
  end

end
