class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :reservation_time
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
