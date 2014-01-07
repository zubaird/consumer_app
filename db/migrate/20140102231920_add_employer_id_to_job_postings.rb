class AddEmployerIdToJobPostings < ActiveRecord::Migration
  def change
    add_column :job_postings, :employer_id, :integer
  end
end
