class AddZipcordToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :zipcord, :string
  end
end
