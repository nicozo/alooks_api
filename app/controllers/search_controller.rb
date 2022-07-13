class SearchController < ApplicationController
  def search
    response_json = Utils::ApexLegendsApiClient.get_stats(api_params)
    render json: response_json
  end

  private

  def api_params
    params.permit(:platform, :game_id)
  end
end
