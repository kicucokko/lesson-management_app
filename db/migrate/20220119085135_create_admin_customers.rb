class CreateAdminCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_customers do |t|
      t.references :admin, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
      t.index [:admin_id,:customer_id], unique: true
    end
  end
end
