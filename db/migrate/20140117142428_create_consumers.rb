class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :firstname
      t.string :lastname
      t.string :city
      t.string :state
      t.integer :zip
      t.string :bio

      t.timestamps
    end
  end
end
