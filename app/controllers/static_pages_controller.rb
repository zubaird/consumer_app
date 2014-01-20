class StaticPagesController < ApplicationController

	def home
		if signed_in?
  			@account = current_user
  		else
  			@account = Account.new
  		end

	end

	def about
	end

	def help
	end

	def contact
	end
	
end
