class StaticPagesController < ApplicationController

	def home
		#index page
		 if signed_in?
		 	@video = current_user.videos.build
		 	@videos = Video.all
		 else
			@user = User.new
		 end
	end
end
