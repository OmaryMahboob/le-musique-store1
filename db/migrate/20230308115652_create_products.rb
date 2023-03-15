class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
