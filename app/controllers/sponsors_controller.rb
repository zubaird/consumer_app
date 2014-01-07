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
		@candidatesfeed_items = current_user.candidates.paginate(page: params[:page])
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
