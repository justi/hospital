class Patient < ApplicationRecord
  validates_presence_of :name, :surname, :pesel
  validates :pesel, format: { with: /\d{11}/,
                              message: "should contain 11 digits"}

  def name_and_surname
    "#{name} #{surname}"
  end

  def to_s
    name_and_surname
  end
end
