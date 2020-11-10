class RemoveDeletedFromEndUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :end_users, :deleted, :boolean
  end
end
