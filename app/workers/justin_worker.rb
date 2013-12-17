
class JustinWorker
	include Sidekiq::Worker
	include Sidetiq::Schedulable

	recurrence { minutely }

	def perform
		# create a JustinStat and save it in the database
		uri = URI("http://api.justin.tv/api/stream/summary.json")
		response = Net::HTTP.get(uri)
		attributes = JSON.parse(response)
		JustinStat.create(viewers_count: attributes["viewers_count"], streams_count: attributes["streams_count"])
	end
end