module Mbta
  module Server
    def servertime
      # TODO: JSON parse
      return @connection.get(path: '/servertime', query: { api_key: @config.api_key, format: @config.format })
    end
  end
end