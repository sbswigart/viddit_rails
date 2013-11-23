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
		parse_youtube_html
	end

	def parse_youtube_html
		if self.provider_name == "YouTube"
		  current_html = self.html
			new_html = current_html.match(/http[\w|\W]+\?/)
			self.html = "<iframe width=\"940\" height=\"526\" src=\"#{new_html}autohide=1&amp;fs=1&amp;autoplay=0&amp;iv_load_policy=3&amp;rel=0&amp;modestbranding=1&amp;showinfo=0&amp;hd=1\" frameborder=\"0\" allowfullscreen=\"\"></iframe>"
		end
	end
end
