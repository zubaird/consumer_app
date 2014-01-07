class SessionsController < ApplicationController


	def new
	end

	def create
		account = Account.find_by(email: params[:session][:email].downcase)
		if account && account.authenticate(params[:session][:password])
		    sign_in account
      		redirect_to root_path
		else
		    flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      		render 'new'
		end
	end

	def destroy
	    sign_out
	    redirect_to root_url
	end



end
