class Reservation < ApplicationRecord
  belongs_to :patient

  validates_presence_of :reservation_time

  validate :reservation_time_cannot_be_in_the_past

  def reservation_time_cannot_be_in_the_past
    if reservation_time.present? && reservation_time < DateTime.now
      errors.add(:reservation_time, "can't be in the past")
    end
  end
end
