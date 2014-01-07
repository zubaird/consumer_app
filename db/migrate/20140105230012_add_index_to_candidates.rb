class AddIndexToCandidates < ActiveRecord::Migration
  def change
    add_index :candidates, :sponsor_id
  end
end
