class CandidatesController < ApplicationController

	before_filter :signed_in_user
	before_filter :correct_user, only: :destroy


 def new
 	@candidate = current_user.candidates.new
 end

def show
	@candidate = Candidate.find(params[:id])
	@postingsponsor = Sponsor.find(@candidate.sponsor_id)
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
		if current_user? current_user
		@candidate.destroy	
		redirect_to sponsor_path(current_user)
		end
	end

private
	def correct_user
		@candidate = current_user.candidates.find_by_id(params[:id]) #testing if nil.
		redirect_to root_path if @candidate.nil?
	end



end
