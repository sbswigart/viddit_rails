class JustinStatsController < ApplicationController
	layout "stats"

	def index
		if signed_in?
	 		@video_new = current_user.videos.build
	 	end

	 	@stats = JustinStat.all

	end
end
