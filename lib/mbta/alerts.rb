require 'json'

module Mbta
  module Alerts
    ##
    # Gets all alerts.
    #
    # Options:
    # - include_access_alerts (defaults to false)
    # - include_service_alerts (defaults to true)
    def alerts(options: {})
      query_hash = default_params.merge({
        include_access_alerts: options.delete(:include_access_alerts),
        include_service_alerts: options.delete(:include_service_alerts)
      })
      if (options.delete(:only_headers))
        response = @connection.get(path: "#{@config[:base_uri]}/alertheaders", query: query_hash)
      else
        response = @connection.get(path: "#{@config[:base_uri]}/alerts", query: query_hash)
      end
      build_alerts_from_response(JSON.parse(response.body))
    end

    def alertsbyroute(route_id:, options: {})
      return alerts(options: options) if route_id.nil?
      query_hash = default_params.merge({
        route:                  route_id,
        include_access_alerts:  options.delete(:include_access_alerts),
        include_service_alerts: options.delete(:include_service_alerts)
      })
      if (options.delete(:only_headers))
        response = @connection.get(path: "#{@config[:base_uri]}/alertheadersbyroute", query: query_hash)
      else
        response = @connection.get(path: "#{@config[:base_uri]}/alertsbyroute", query: query_hash)
      end
      build_alerts_from_response(JSON.parse(response.body))
    end

    def alertsbystop(stop_id:, options: {})
      return alerts(options: options) if stop_id.nil?
      query_hash = default_params.merge({
        stop:                   stop_id,
        include_access_alerts:  options.delete(:include_access_alerts),
        include_service_alerts: options.delete(:include_service_alerts)
      })
      if (options.delete(:only_headers))
        response = @connection.get(path: "#{@config[:base_uri]}/alertheadersbystop", query: query_hash)
      else
        response = @connection.get(path: "#{@config[:base_uri]}/alertsbystop", query: query_hash)
      end
      build_alerts_from_response(JSON.parse(response.body))
    end


    def alertbyid(alert_id:, options: {})
      return alerts(options: options) if alert_id.nil?
      query_hash = default_params.merge({
        id:                     alert_id,
        include_access_alerts:  options.delete(:include_access_alerts),
        include_service_alerts: options.delete(:include_service_alerts)
      })
      response = @connection.get(path: "#{@config[:base_uri]}/alertbyid", query: query_hash)
      Mbta::Alert.new(JSON.parse(response.body))
    end

    def alertheaders(options: {})
      # This is the same as #alerts, but only returns headers
      return alerts(options: options.merge({ only_headers: true }))
    end

    def alertheadersbyroute(route_id:, options: {})
      # This is the same as #alertsbyroute, but only returns headers
      options[:only_headers] = true
      return alerts(options: options) if route_id.nil?
      return alertsbyroute(route_id: route_id, options: options)
    end

    def alertheadersbystop(stop_id:, options: {})
      # This is the same as #alertsbystop, but only returns headers
      options[:only_headers] = true
      return alerts(options: options) if stop_id.nil?
      return alertsbystop(stop_id: stop_id, options: options)
    end

    private

    def build_alerts_from_response(data_hash)
      # data_hash is an array of alerts
      data_hash["alerts"].map { |alert| Mbta::Alert.new(alert) }
    end
  end
end