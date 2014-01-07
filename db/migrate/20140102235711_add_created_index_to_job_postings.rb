class AddCreatedIndexToJobPostings < ActiveRecord::Migration
  def change
    add_index :job_postings, :created_at
  end
end
