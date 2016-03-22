module Mbta
  module Server
    def servertime
      # Returns the time at the server, in epoch time
      # TODO: Parse response JSON
      return @connection.get(path: '/servertime', query: { api_key: @config[:api_key], format: @config[:format] })
    end
  end
end