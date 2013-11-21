class StaticPagesController < ApplicationController

	def home
		#index page
		@user = User.new
	end
end
