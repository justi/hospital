class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: 'Staff'
  belongs_to :nurse, class_name: 'Staff', optional: true
  belongs_to :reservation

  def to_s
    "#{reservation.patient.name_and_surname} - #{doctor.name_and_surname}"
  end
end