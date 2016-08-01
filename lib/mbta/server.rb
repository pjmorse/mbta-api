module Mbta
  module Server
    def servertime
      # API responds with the time at the server, in epoch time
      response = @connection.get(path: "#{@config[:base_uri]}/servertime", query: { api_key: @config[:api_key], format: @config[:format] })
      return parse_timestamp(JSON.parse(response.body)["server_dt"])
    end
  end
end