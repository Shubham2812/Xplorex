class AddPhotoToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :photo, :string
  end
end
