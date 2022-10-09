class SearchController < ApplicationController
  skip_before_action :authenticate_user, only: %i[map_rotation news]

  def search
    response_json = Utils::ApexLegendsApiClient.get_stats(api_params)
    render json: response_json
  end

  def map_rotation
    response_json = Utils::ApexLegendsApiClient.get_map_data()
    render json: response_json
  end

  def news
    response_json = Utils::ApexLegendsApiClient.get_news()

    render json: response_json
  end

  private

  def api_params
    params.permit(:platform, :game_id)
  end
end
