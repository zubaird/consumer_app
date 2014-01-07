class Sponsor < Account


	has_many :candidates, dependent: :destroy
	
	accepts_nested_attributes_for :candidates

	acts_as_messageable



end
