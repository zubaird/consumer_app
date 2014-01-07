class AccountsController < ApplicationController

	before_action :signed_in_user, only: [:edit, :update, :index, :destroy, :following, :followers] 
	before_action :correct_account,  only: [:edit, :update] 

	def index
		@account = Account.all
	end

	def new
		@account = Account.new
	end

	def show
		@account = Account.find(params[:id])
	end
	
	def create
		@account = Account.new(account_new_params)
		if @account.save
			sign_in @account
			flash[:success] = "Welcome! Thanks for signing up!"

			redirect_to root_path

		else
			render 'new'
		end
	end

	def edit
		@account = Account.find(params[:id])
	end

	def update
		if @account.update_attributes(account_new_params)
			flash[:success] = "Profile updated"
			redirect_to @account
		else
			render 'edit'
		end
	end

# => The 2 Methods below are to do friendly forwarding



private

	def account_new_params # =>  INSTEAD OF User.new(params[:user]), allows only certain params to go through
		params.require(:account).permit(:name, :email, :password, :password_confirmation, :type)
	end


	def correct_account 
		@account = Account.find(params[:id])
		redirect_to(root_url) unless current_user?(@account)
	end


	# def account_update_params # =>  INSTEAD OF User.new(params[:user]), allows only certain params to go through
	# 	params.require(:employer).permit(:name, :email, :password, :password_confirmation)
	# end

	  #Before Filters



  # def admin_user
  #   redirect_to(root_url) unless current_user.admin?
  # end

end
