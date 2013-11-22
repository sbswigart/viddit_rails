require 'net/https'

class Video < ActiveRecord::Base
	belongs_to :user

	def fill_attributes
		video_url = CGI::escape(self.video_url)
		uri = URI("http://www.youtube.com/oembed?url=" + video_url)
		response = Net::HTTP.get(uri)
		attributes = JSON.parse(response)
		parse_attributes(attributes)
	end

	def parse_attributes(attributes)
		self.provider_name = attributes["provider_name"]
		self.content_type = attributes["type"]
		self.thumbnail_width = attributes["thumbnail_width"]
		self.author_url = attributes["author_url"]
		self.html = attributes["html"]
		self.provider_url = attributes["provider_url"]
		self.version = attributes["version"]
		self.thumbnail_height = attributes["thumbnail_height"]
		self.title = attributes["title"]
		self.author_name = attributes["author_name"]
		self.height = attributes["height"]
		self.width = attributes["width"]
		self.thumbnail_url = attributes["thumbnail_url"]
	end
end
