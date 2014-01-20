class JobPosting < ActiveRecord::Base



	attr_accessible :title, :description, :city, :state, :tag

	belongs_to :employer 

	validates :title, presence: true, length: { maximum: 140, minimum: 15 }, uniqueness: { case_sensitive: false }
	validates :description, presence: true, length: { minimum: 140 }
	VALID_LOCATION_REGEX = /[a-zA-Z]/i
	validates :city, presence: true,  format: { with: VALID_LOCATION_REGEX } 
	validates :state, presence: true, length: { maximum: 2 }, format: { with: VALID_LOCATION_REGEX } 
	validates :tag, format: { with: VALID_LOCATION_REGEX }, :allow_blank => true
	# validates :employer_id, presence: true

def jobpostfeed
  JobPosting.where("employer_id = ?", id)
end


end
