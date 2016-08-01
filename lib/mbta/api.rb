# Connection modules
require "mbta/version"
require "mbta/routes"
require "mbta/stops"
require "mbta/schedule"
require "mbta/predictions"
require "mbta/vehicles"
require "mbta/alerts"
require "mbta/server"

# Utilities
require "mbta/times"
require "excon"

# Response classes
require "mbta/alert"

module Mbta
  class Api
    AVAILABLE_QUERIES = %w(routes 
                           routesbystop
                           stopsbyroute
                           stopsbylocation
                           schedulebystop
                           schedulebyroute
                           schedulebytrip
                           predictionsbystop
                           predictionsbyroute
                           predictionsbytrip
                           vehiclesbyroute
                           vehiclesbytrip
                           alerts
                           alertsbyroute
                           alertsbystop
                           alertbyid
                           alertheaders
                           alertheadersbyroute
                           alertheadersbystop
                           servertime)

    # MBTA_API_KEY = 'wX9NwuHnZU2ToO7GmGR9uw' # Dev key

    # Blank Slate
    instance_methods.each do |m|
      undef_method m unless m.to_s =~ /^__|object_id|method_missing|respond_to?|to_s|inspect|kind_of?|should|should_not/
    end

    include Mbta::Routes
    include Mbta::Stops
    include Mbta::Schedule
    include Mbta::Predictions
    include Mbta::Vehicles
    include Mbta::Alerts
    include Mbta::Server

    def initialize(config: {})
      defaults = {
        host:     'realtime.mbta.com',
        base_uri: 'developer/api/v2',
        format:   :json,
        protocol: 'https',
        api_key:  defined?(MBTA_API_KEY) ? MBTA_API_KEY : nil
      }
      @config = defaults.merge(config).freeze
      @connection = Excon.new("#{@config[:protocol]}://#{@config[:host]}/#{@config[:base_uri]}")
    end

    def method_missing(api_method, *args)
    end

    def respond_to?(api_method)
    end

    def default_params
      {
        api_key: @config[:api_key],
        format:  @config[:format]
      }
    end
  end

  class APIError < StandardError
    def message
      'The API returned an error or other unexpected result'
    end
  end

  class MethodNotImplemented < StandardError
    def message
      "We intend for this to work sometime, but right now it doesn't"
    end
  end
end
