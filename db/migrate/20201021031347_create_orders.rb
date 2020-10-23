class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :end_user_id
      t.string :zipcord
      t.string :address
      t.string :name
      t.integer :shipping
      t.integer :total_payment
      t.integer :payment_method
      t.integer :status
      t.timestamps
    end
  end
end
