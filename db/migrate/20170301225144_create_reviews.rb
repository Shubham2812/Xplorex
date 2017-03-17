class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :customerID
      t.string :category
      t.string :outletID
      t.string :content
      t.integer :rating
      t.boolean :visited
      t.boolean :recommend

      t.timestamps null: false
    end
  end
end
