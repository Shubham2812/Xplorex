class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :outletID
      t.string :category
      t.string :content
      t.date :from
      t.date :to

      t.timestamps null: false
    end
  end
end
