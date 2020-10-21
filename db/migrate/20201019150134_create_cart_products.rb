class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|

      t.integer :end_user_id
      t.integer :product_id
      t.integer :quantity, default: 0
      t.timestamps
    end
  end
end
