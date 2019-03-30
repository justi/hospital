class Staff < ApplicationRecord
  validates_presence_of :name, :surname, :pesel
  validates :pesel, format: { with: /\d{11}/,
                              message: "should contain 11 digits"}
  validates :occupation, inclusion: { in: %w(doctor nurse),
                                      message: "should be doctor or nurse"}

  enum occupation: { doctor: 0, nurse: 1 }
end
