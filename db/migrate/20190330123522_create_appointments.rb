class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :doctor
      t.references :nurse, null: true
      t.references :reservation, foreign_key: true

      t.timestamps
    end
  end
end
