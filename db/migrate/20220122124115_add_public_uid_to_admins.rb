class AddPublicUidToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :public_uid, :string
  end
end
