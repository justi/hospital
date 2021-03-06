# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: "Staff"
  belongs_to :nurse, class_name: "Staff", optional: true
  belongs_to :reservation
  has_one :bill, dependent: :destroy

  def to_s
    "#{reservation.patient.name_and_surname} - #{doctor.name_and_surname}"
  end
end
