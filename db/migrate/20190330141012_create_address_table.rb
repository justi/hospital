# frozen_string_literal: true

class CreateAddressTable < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true
    end
  end
end
