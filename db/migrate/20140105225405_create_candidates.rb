class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :city
      t.string :state
      t.text :bio
      t.boolean :has_transport
      t.string :additional_skills
      t.integer :sponsor_id

      t.timestamps
    end
  end
end
