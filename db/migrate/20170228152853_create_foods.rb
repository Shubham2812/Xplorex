class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :ownerID
      t.string :name
      t.string :tag
      t.string :location
      t.string :photo
      t.string :description
      t.string :menu

      t.timestamps null: false
    end
  end
end
