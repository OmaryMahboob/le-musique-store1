class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :address
      t.boolean :admin

      t.timestamps
    end
  end
end