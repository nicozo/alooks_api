class SearchController < ApplicationController
  require 'uri'
  require 'net/http'

  def search
    game_id = params[:game_id]
    platform = params[:platform]
    api_key = ENV['API_KEY']
    url = "https://api.mozambiquehe.re/bridge"
    uri = URI.parse(url)
    params = {
      platform: platform,
      player: game_id,
      auth: api_key
    }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    render json: res.body if res.is_a?(Net::HTTPSuccess)
  end
end
