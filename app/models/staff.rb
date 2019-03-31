class Staff < ApplicationRecord
  has_many :doctor_appointments, class_name: 'Appointment', foreign_key: 'doctor_id', dependent: :destroy
  has_many :nurse_appointments, class_name: 'Appointment', foreign_key: 'nurse_id', dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address

  validates_presence_of :name, :surname, :pesel
  validates :pesel, format: { with: /\d{11}/,
                              message: "should contain 11 digits"}
  validates :occupation, inclusion: { in: %w(doctor nurse),
                                      message: "should be doctor or nurse"}

  enum occupation: { doctor: 0, nurse: 1 }

  scope :doctors, -> {where(occupation: 'doctor')}
  scope :nurses, -> {where(occupation: 'nurse')}

  def name_and_surname
    "#{name} #{surname}"
  end

  def to_s
    name_and_surname
  end
end
