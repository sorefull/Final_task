class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.boolean :completed, default: false
      t.integer :user_id,  null: false
      t.string :contact_phone
      t.text :additional
      t.timestamps
    end
  end
end
