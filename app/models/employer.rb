class Employer < Account


	has_many :job_postings, dependent: :destroy
	
	accepts_nested_attributes_for :job_postings

	acts_as_messageable


end
