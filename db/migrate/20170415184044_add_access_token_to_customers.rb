class AddAccessTokenToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :access_token, :string
  end
end
