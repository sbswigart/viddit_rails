require 'net/http'

class VideosController < ApplicationController

	def new
	end

	def create
		@video = current_user.videos.build(video_param)
		@video.fill_attributes
		if @video.save
			redirect_to root_url
		else

		end
	end

	def destroy
	end

	private

	def video_param
		params.require(:video).permit(:video_url)
	end

end