class JustinStat < ActiveRecord::Base
	def self.last_day_in_hours
		all = JustinStat.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: Time.now - 1.day, end_date: Time.now})
		hours = []
		all.each_with_index do |stat, index|
			if index % 60 == 0
				hours << stat
			end
		end
		hours
	end

	def self.last_week_in_days
		all = JustinStat.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: Time.now - 7.day, end_date: Time.now})
		days = []
		all.each_with_index do |stat, index|
			if index % 1440 == 0
				days << stat
			end
		end
		days
	end
end
