class Api::V1::Admin::UsersController < Api::V1::Admin::BaseController
  def index
    users = User.all.order(id: :desc)

    render json: users.as_json(only: %i[id name email self_introduction date_of_birth sex game_id platform role])
  end
end
