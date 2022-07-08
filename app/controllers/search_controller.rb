class SearchController < ApplicationController
  require "http"

  def search
    platform = params[:platform]
    game_id = params[:game_id]
    api_key = ENV['API_KEY']
    res = HTTP.get(
      'https://api.mozambiquehe.re/bridge',
      :params => {
        :platform => platform,
        :player => game_id,
        :auth => api_key
        }
      )
    render json: res.to_s
  end
end
