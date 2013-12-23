module JustinStatsHelper
	def interval(inter)
		if inter == "minutely"
	 		@stats = JustinStat.last(60)
	 	elsif inter == "hourly"
	 		@stats = JustinStat.last_day_in_hours
	 	elsif inter == "daily"
	 		@stats = JustinStat.last_week_in_days
	 	else
	 		@stats = JustinStat.last(720)
	 	end
	end
end
