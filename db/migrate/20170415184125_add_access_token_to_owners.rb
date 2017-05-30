class AddAccessTokenToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :access_token, :string
  end
end
