class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :customerID
      t.string :category
      t.integer :outletID
      t.integer :numPersons
      t.date :date
      t.time :time
      t.integer :status

      t.timestamps null: false
    end
  end
end
