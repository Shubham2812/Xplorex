class AddPhotoToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :photo, :string
  end
end
