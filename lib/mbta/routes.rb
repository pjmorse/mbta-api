module Mbta
  module Routes
    def routes
      response = @connection.get(path: "#{@config[:base_uri]}/routes", query: default_params)
      build_routes_from_response(JSON.parse(response.body))
    end

    def routesbystop(stop_id:)
      return routes if stop_id.nil?
      response = @connection.get(path: "#{@config[:base_uri]}/routesbystop", query: default_params.merge({ stop_id: stop_id }))
      build_routes_from_response(JSON.parse(response.body))      
    end

    private

    def build_routes_from_response(data_hash)
      data_hash.delete("stop_id") # Probably there's something better to do here
      data_hash.delete("stop_name")
      data_hash["route_list"].map { |mode| Mbta::Mode.new(mode) }
    end
  end
end