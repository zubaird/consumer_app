class CreateAccounts < ActiveRecord::Migration
  def change
  	create_table :accounts do |t|
		t.string :name
		t.string :email
		t.string :password_digest
		t.string :remember_token
		t.string :type

    	t.timestamps
    end
  end
end
