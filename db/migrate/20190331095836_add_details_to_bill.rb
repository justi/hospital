class AddDetailsToBill < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :is_paid, :boolean, default: false, null: false
    add_column :bills, :paid_date, :datetime, null: true
  end
end
