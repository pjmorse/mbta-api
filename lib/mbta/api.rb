require "mbta/api/version"
require 'httparty'

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
        base_uri: 'realtime.mbta.com/developer/api/v2',
        format:   :json,
        api_key:  MBTA_API_KEY ? MBTA_API_KEY : nil
      }
      @config = defaults.merge(config).freeze
    end

    def method_missing(api_method, *args)
    end

    def respond_to?(api_method)
    end
  end

  class APIError < StandardError
    # The API returned an error or other unexpected result
  end

  class MethodNotImplemented < StandardError
    # We intend for this to work sometime, but right now it doesn't
  end
end
