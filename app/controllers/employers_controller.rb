class EmployersController < AccountsController


	before_action :signed_in_user, only: [:edit, :update, :index, :destroy, :following, :followers] 
	before_action :correct_account,  only: [:edit, :update] 

	# def index
	# 	@emplyer = Employer.all
	# end

	def new
		@job_posting = JobPosting.new
	end

	def show
		if signed_in?
		@employer = Employer.find(params[:id])
		@jobpostfeed_items = current_user.job_postings.paginate(page: params[:page])
		end
	end
	
	def create
		@employer = Employer.new(account_new_params)
		if @employer.save
			sign_in @employer
			flash[:success] = "Welcome! Thanks for signing up!"

			redirect_to root_path

		else
			render 'new'
		end
	end

	def edit
		@employer = Employer.find(params[:id])
	end

	def update
		if @employer.update_attributes(account_new_params)
			flash[:success] = "Profile updated"
			redirect_to @employer
		else
			render 'edit'
		end
	end

# => The 2 Methods below are to do friendly forwarding

	def store_location  # => a.k.a. store_location
		session[:return_to] = request.url if request.get?  #request is a special object that gets the URL of the requested page.
	end

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_path, notice: "Please sign in."
		end
	end

	private

		def account_new_params # =>  INSTEAD OF User.new(params[:user]), allows only certain params to go through
			params.require(:employer).permit(:name, :email, :password, :password_confirmation, :type)
		end


		def correct_account 
			@employer = Employer.find(params[:id])
			redirect_to(root_url) unless current_user?(@employer)
		end


		# def account_update_params # =>  INSTEAD OF User.new(params[:user]), allows only certain params to go through
		# 	params.require(:employer).permit(:name, :email, :password, :password_confirmation)
		# end

		  #Before Filters


		# def admin_user
		#   redirect_to(root_url) unless current_user.admin?
		# end

end
