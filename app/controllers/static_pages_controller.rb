class StaticPagesController < ApplicationController

	def home
		if signed_in?
  			@account = current_user
  		end
	end

	def about
	end

	def help
	end

	def contact
	end
	
end
