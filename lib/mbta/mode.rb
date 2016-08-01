module Mbta
  class Mode
    attr_accessor :route_type, :mode_name, :routes

    def initialize(data_hash)
      @raw_data = data_hash
      @route_type = data_hash["route_type"]
      @mode_name  = data_hash["mode_name"]
      @routes     = data_hash["route"]
    end

    def show_routes
      @routes.map { |route| Mbta::Route.new(route) }
    end
  end
end
