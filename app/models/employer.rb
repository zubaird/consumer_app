class Employer < Account



	has_many :job_postings, dependent: :destroy
	
	accepts_nested_attributes_for :job_postings

	acts_as_messageable
  acts_as_followable
  acts_as_follower

def mailboxer_email(object)
  return nil
end

  # def following?(other_user)
  #   relationships.find_by(followed_id: other_user.id)
  # end

  # def follow!(other_user)
  #   relationships.create!(followed_id: other_user.id)
  # end

  # def unfollow!(other_user)
  #   relationships.find_by(followed_id: other_user.id).destroy!
  # end

end
