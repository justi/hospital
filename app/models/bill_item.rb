class BillItem < ApplicationRecord
  has_and_belongs_to_many :bills
end
