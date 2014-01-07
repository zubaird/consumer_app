class Rename < ActiveRecord::Migration
  def change
  	rename_table :accounts, :accounts
  end
end
