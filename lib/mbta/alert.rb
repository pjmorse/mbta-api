module Mbta
  class Alert

    include Mbta::Times  

    attr_accessor :alert_id, :effect_name, :effect, :cause_name, :cause, :header_text,
            :short_header_text, :url, :description_text, :severity, :created_dt, 
            :last_modified_dt, :service_effect_text, :timeframe_text, :alert_lifecycle,
            :banner_text, :affected_services

    def initialize(data_hash)
      @raw_data            = data_hash
      @alert_id            = data_hash["alert_id"]
      @effect_name         = data_hash["effect_name"]
      @effect              = data_hash["effect"]
      @cause_name          = data_hash["cause_name"]
      @cause               = data_hash["cause"]
      @header_text         = data_hash["header_text"]
      @short_header_text   = data_hash["short_header_text"]
      @url                 = data_hash["url"]
      # @image_url = data_hash["image_url"]
      @description_text    = data_hash["description_text"]
      @severity            = data_hash["severity"]
      @created_dt          = parse_timestamp(data_hash["created_dt"])
      @last_modified_dt    = parse_timestamp(data_hash["last_modified_dt"])
      @service_effect_text = data_hash["service_effect_text"]
      @timeframe_text      = data_hash["timeframe_text"]
      @alert_lifecycle     = data_hash["alert_lifecycle"]
      @banner_text         = data_hash["banner_text"]
      # @announcement_text = data_hash["announcement_text"] # Not yet implemented by MBTA
      @effect_periods      = data_hash["effect_periods"]
        # Array of hashes:
        # { effect_period: { effect_start: <datetime>, effect_end: <datetime> }}
      @affected_services = data_hash["affected_services"]
        # Hash contains keys "services" and "elevators"
    end

    def show_effect_periods
      @effect_periods.map do |period| 
        {
          effect_start: parse_timestamp(period["effect_start"]),
          effect_end:   parse_timestamp(period["effect_end"])
        }
      end
    end

    def show_affected_routes
      @affected_services["services"].map do |route|
        # Generate a Route object from the hash defined in route
      end
    end

    def show_affected_elevators
      @affected_services["elevators"]
    end
  end
end

