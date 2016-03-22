module Mbta
  module Alerts

    ##
    # Gets all alerts.
    #
    # Options:
    # - include_access_alerts (defaults to false)
    # - include_service_alerts (defaults to true)
    def alerts(options: {})
      query_hash = {
        api_key: @config[:api_key],
        format: @config[:format]
      }.merge(options.delete(:include_access_alerts)).
        merge(options.delete(:include_service_alerts))
      @connection.get(path: '/alerts', query: query_hash)
      # TODO: Parse return JSON
    end

    def alertsbyroute
      raise MethodNotImplemented
    end

    def alertsbystop
      raise MethodNotImplemented
    end

    def alertbyid
      raise MethodNotImplemented
    end

    def alertheaders
      raise MethodNotImplemented
    end

    def alertheadersbyroute
      raise MethodNotImplemented
    end

    def alertheadersbystop
      raise MethodNotImplemented
    end
  end
end