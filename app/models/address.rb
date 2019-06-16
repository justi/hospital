# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  validates_presence_of :city, :street_no, :postal_code
end
