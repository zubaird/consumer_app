class JobPostingsController < ApplicationController


	before_filter :signed_in_user
	before_filter :correct_user, only: :destroy

def index
	@jobposting = JobPosting.find(params[:id])
end

def show
	@jobposting = JobPosting.find(params[:id])
	@postingemployer = Employer.find(@jobposting.employer_id)
end


def new
	@job_posting = current_user.job_postings.new
end


def create
	@job_posting = current_user.job_postings.build(params[:job_posting])
	if @job_posting.save
		flash[:success] = "Job Posting Created!"
		redirect_to employer_path(current_user)
	else
		# @feed_items = []
		render 'new'
	end
end

	def destroy
		if current_user? current_user
		@jobposting.destroy	
		redirect_to employer_path(current_user)
		end
	end


private

	#might need to make it job_postings.find_by_id...
	def correct_user
		@job_posting = current_user.job_posting.find_by_id(params[:id]) #testing if nil.
		redirect_to root_path if @job_posting.nil?
	end

end
