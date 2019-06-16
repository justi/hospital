# frozen_string_literal: true

class Patient < ApplicationRecord
  before_destroy do
    add_errors_if_unpaid
    throw(:abort) if errors.present?
  end

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :reservations, dependent: :destroy
  has_one_attached :avatar

  validates_presence_of :name, :surname, :pesel
  validates :pesel, format: { with: /\d{11}/,
                              message: "should contain 11 digits" }

  def name_and_surname
    "#{name} #{surname}"
  end

  def to_s
    name_and_surname
  end

  private
    def add_errors_if_unpaid
      errors.add(:base, "Cannot delete patient with unpaid bills") if any_unpaid_bill_exists?
    end

    def any_unpaid_bill_exists?
      reservations.joins(:bill).where("bills.is_paid = false").exists?
    end
end
