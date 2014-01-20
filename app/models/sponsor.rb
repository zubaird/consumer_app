class Sponsor < Account

	has_many :candidates, dependent: :destroy
	
	accepts_nested_attributes_for :candidates

	acts_as_messageable

	#this was not in, and everything seemed to still work.
  	acts_as_followable
  	acts_as_follower




def mailboxer_email(object)
	return nil
end



 #  	def following?(other_user)
 #  		self.relationships.find_by_followed_id(other_user.id)  
 #  	end


	# def follow!(other_user)
	# 	self.relationships.create!(followed_id: other_user.id)
	# end

	# def unfollow!(other_user)
	# 	self.relationships.find_by_followed_id(other_user.id).destroy
	# end

end
