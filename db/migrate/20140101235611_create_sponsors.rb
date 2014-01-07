class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :string
      t.string :email
      t.string :string

      t.timestamps
    end
  end
end
