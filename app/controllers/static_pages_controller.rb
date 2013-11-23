class StaticPagesController < ApplicationController

	def home
		#index page
		@videos = Video.all
		@user = User.new
		if signed_in?
	 		@video_new = current_user.videos.build
	 	end
	end
end
