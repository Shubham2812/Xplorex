class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :gender
      t.string :phone
      t.string :address
      t.string :city

      t.timestamps null: false
    end
  end
end
