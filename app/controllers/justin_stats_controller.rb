class JustinStatsController < ApplicationController
	include JustinStatsHelper
	layout "stats"

	def index
		if signed_in?
	 		@video_new = current_user.videos.build
	 	end
	 	interval(params[:interval])
	end
end
