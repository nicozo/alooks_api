module Utils
  class ApexLegendsApiClient
    def initialize
      @api_key = ENV['API_KEY']
    end

    def get_stats(params)
      res = HTTP.get(
        APEX_LEGENDS_API_URI,
        params: {
          platform: params[:platform],
          player: params[:game_id],
          auth: @api_key
        }
      )
      res.to_s
    end

    def get_map_data()
      res = HTTP.get(
        MAP_ROTATION_API_URI,
        params: {
          auth: @api_key
        }
      )
      res.to_s
    end

    class << self
      def client
        ApexLegendsApiClient.new
      end

      def get_stats(params)
        client.get_stats(params)
      end

      def get_map_data()
        client.get_map_data()
      end
    end

    APEX_LEGENDS_API_URI = 'https://api.mozambiquehe.re/bridge'
    APEX_LEGENDS_API_URI.freeze
    MAP_ROTATION_API_URI = 'https://api.mozambiquehe.re/maprotation'
    MAP_ROTATION_API_URI.freeze
  end
end
