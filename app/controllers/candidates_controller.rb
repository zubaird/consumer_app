class CandidatesController < ApplicationController

	before_filter :signed_in_user
	before_filter :correct_user, only: :destroy


 def new
 	@candidate = current_user.candidates.new
 end


	def create
		@candidate = current_user.candidates.build(params[:candidate])
		if @candidate.save
			flash[:success] = "Candidate Added!"
			redirect_to sponsor_path(current_user)
		else
			# @feed_items = []
			render 'new'
		end
	end

	def destroy
		@candidate.destroy	
		redirect_to sponsor_path(current_user)
	end

private
	def correct_user
		@candidate = current_user.candidates.find_by_id(params[:id]) #testing if nil.
		redirect_to root_path if @candidate.nil?
	end



end



# Olaf the amazing is quite the candidate, he has always been a passionate craftsman, never turning down an 
# opportunity to fashion shiny horns to adorn viking helmets for everyday folk.  Olaf is interested in growing his viking 
# helmet skills and making new friends in the workforce.  He has a very high attention to detail and would be a great asset to any team.