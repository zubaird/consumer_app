class SponsorsController < ApplicationController


	before_action :signed_in_user, only: [:edit, :update, :index, :destroy, :following, :followers] 
	before_action :correct_account,  only: [:edit, :update] 

	# def index
	# 	@sponsor = Sponsor.all
	# end

	# def new
	# 	@sponsor = Sponsor.new
	# end

	def show
		if signed_in?
			@sponsor = Sponsor.find(params[:id])
			@candidatesfeed_items = @sponsor.candidates.paginate(page: params[:page])
			@candidatesfeed = @sponsor.candidates.paginate(page: params[:page], per_page: 5)
			@currentusermailbox = @sponsor.mailbox.inbox.paginate(page: params[:mailbox], per_page: 5)
			@currentusersentbox = @sponsor.mailbox.sentbox.paginate(page: params[:sentbox], per_page: 5)

			if params[:searchjobs] != nil
				@query = params[:searchjobs]
			else 
				@query = " "
			end

			@jobsearchresults = []
			unless params[:searchjobs].nil? || params[:searchjobs].strip.empty?
				@search = JobPosting.search {fulltext params[:searchjobs]}
				@jobsearchresults = @search.results
			end
			@jobsearchresults
		end
	end

	def edit
		@sponsor = Sponsor.find(params[:id])
	end


	def update
		if @sponsor.update_attributes(account_new_params)
			flash[:success] = "Profile updated"
			redirect_to @sponsor
		else
			render 'edit'
		end
	end


	# def followthis
	# 	@find_account = Sponsor.find_by(email: params[:session][:email].downcase)
	# 	redirect_to @sponsor
	# end


	def followme 
		search = params[:search]
		@user = Account.find_by(email: search)

	  if current_user

	    if current_user == @user
			flash[:error] = "You cannot follow yourself."
			redirect_to sponsor_path(current_user)

		elsif @user == nil
			flash[:error] = "#{search} E-mail could not be found, please make sure that they are signed up!".html_safe
			redirect_to sponsor_path(current_user)

		elsif current_user.following?(@user) == true
			flash[:error] = "You are already following #{search}".html_safe
			redirect_to sponsor_path(current_user)

	    else
			current_user.follow(@user)
			# RecommenderMailer.new_follower(@sponsor).deliver if @sponsor.notify_new_follower
			flash[:success] = "You are now following #{@user.name}."
			redirect_to sponsor_path(current_user)
	    end
	  else
		redirect_to(root_url) 
	  end
	end

	# def search
	# 	q = params[:user][:email]
	# 	@users = Sponsor.find(:all, :conditions => ["name LIKE %?%",q])
	# end



	def store_location  # => a.k.a. store_location
		session[:return_to] = request.url if request.get?  #request is a special object that gets the URL of the requested page.
	end

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_path, notice: "Please sign in first, thank you!"
		end
	end


	private

		def account_new_params # =>  INSTEAD OF User.new(params[:user]), allows only certain params to go through
			params.require(:sponsor).permit(:name, :email, :password, :password_confirmation, :type)
		end

		def correct_account 
			@sponsor = Sponsor.find(params[:id])
			redirect_to(root_url) unless current_user?(@sponsor)
		end

end
