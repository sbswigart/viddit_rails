class JustinStat < ActiveRecord::Base
	def self.chart_data
    JustinStat.all.map do |stat|
      {
        created_at: stat.created_at,
        viewers_count: stat.viewers_count,
        streams_count: stat.streams_count,
      }.to_json
    end
  end
end
