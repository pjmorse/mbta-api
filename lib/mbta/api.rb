require "mbta/api/version"
require 'httparty'

module Mbta
  module Api
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

    class Connection
      include HTTParty
      base_uri 'realtime.mbta.com/developer/api/v2'
      default_params :format => :json, :api_key => @api_key

      def initialize(api_key)
        @api_key = api_key
      end

      def request(query, params={})
        return false unless AVAILABLE_QUERIES.include?(query)
        self.class.get("/#{query}", :query => params)
        
        # Handle the response
      end
    end
  end
end
