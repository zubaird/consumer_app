class RemoveStringFromAccounts < ActiveRecord::Migration
  def change
  	remove_column :accounts, :string, :string
  end
end
