class AddIsAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_admin, :boolean, default: false
  end
end

# rails g migration add_is_admin_to_users is_admin:boolean