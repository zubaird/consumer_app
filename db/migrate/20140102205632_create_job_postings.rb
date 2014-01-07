class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.string :title
      t.text :description
      t.string :city
      t.string :state
      t.string :tag

      t.timestamps
    end
  end
end
