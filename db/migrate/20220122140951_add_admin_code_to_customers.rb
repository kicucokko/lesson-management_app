class AddAdminCodeToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :admin_code, :string
  end
end
