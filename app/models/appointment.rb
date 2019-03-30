class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: 'Staff'
  belongs_to :nurse, class_name: 'Staff', optional: true
  belongs_to :reservation
end