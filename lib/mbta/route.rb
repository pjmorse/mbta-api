module Mbta
  class Route
    attr_accessor :route_id, :route_name, :route_hide

    def initialize(data_hash)
      @raw_data = data_hash
      @route_id   = data_hash["route_id"]
      @route_name = data_hash["route_name"]
      @route_hide = data_hash["route_hide"] || false
    end

    def alerts(connection)
      connection.alertsbyroute(route_id: @route_id)
    end

    def alertheaders(connection)
      connection.alertheadersbyroute(route_id: @route_id)
    end
  end
end
