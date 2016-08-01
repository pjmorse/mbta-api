module Mbta
  module Times
    def parse_timestamp(time_string)
      return nil if time_string.strip.empty? # Otherwise this returns the epoch
      Time.at(time_string.to_i).utc.to_datetime
    end
  end
end