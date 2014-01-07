class AddIndexToJobPostings < ActiveRecord::Migration
  def change
  	add_index :job_postings, :employer_id
  end
end
