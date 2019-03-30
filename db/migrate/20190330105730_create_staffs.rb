class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :surname
      t.string :pesel
      t.integer :occupation, default: 0

      t.timestamps
    end
  end
end
