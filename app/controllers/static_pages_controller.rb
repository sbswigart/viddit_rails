class StaticPagesController < ApplicationController

	def home
		#index page
		 @videos = Video.all
		 if signed_in?
		 	@video = current_user.videos.build
		 else
			@user = User.new
		 end
	end
end
