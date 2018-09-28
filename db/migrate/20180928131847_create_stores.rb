class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :store_number
      t.string :store_email
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.integer :owner_id
      t.integer :director_id
      t.integer :om_id
      t.integer :supervisor_id
      t.integer :gm_id
      t.timestamps
    end
  end
end
