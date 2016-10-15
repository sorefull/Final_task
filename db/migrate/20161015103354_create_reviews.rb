class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :stars
      t.integer :user_id
      t.integer :product_id
      t.boolean :approved, default: false, null: false

      t.timestamps
    end
  end
end
