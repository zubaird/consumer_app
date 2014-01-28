class Candidate < ActiveRecord::Base


	attr_accessible :name, :bio, :city, :state, :additional_skills, :has_transport

	searchable do
    	text :city
	end

	belongs_to :sponsor


	VALID_LOCATION_REGEX = /[a-zA-Z]/i

	validates :name, presence: true, length: { minimum: 1, maximum: 255 }, format: { with: VALID_LOCATION_REGEX } 
	validates :bio, presence: true, length: { minimum: 140 }
	validates :city, presence: true,  format: { with: VALID_LOCATION_REGEX } 
	validates :state, presence: true, length: { maximum: 2 }, format: { with: VALID_LOCATION_REGEX } 
	#validates :has_transport
	#validates :sponsor_id, presence: true
	#validates :additional_skills


def candidatefeed
Candidate.where("candidate_id = ?", id)
end



end
