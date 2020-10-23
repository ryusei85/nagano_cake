class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|

      t.integer :end_user_id
      t.string :zipcord
      t.string :address
      t.string :name
      t.timestamps
    end
  end
end
