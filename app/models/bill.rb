class Bill < ApplicationRecord
  belongs_to :appointment
  has_and_belongs_to_many :bill_items
end
