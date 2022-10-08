class Api::V1::Admin::UsersController < Api::V1::Admin::BaseController
  before_action :set_user, only: %i[update destroy]

  def index
    users = User.all.order(id: :desc)

    render json: users.as_json(only: %i[id name email self_introduction date_of_birth sex game_id platform role])
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: user.errors, status: :bad_request
    end
  end

  def update
    if @user.update(user_update_params)
      render json: @user
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def destroy
    @user.destroy!

    render json: @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def user_update_params
    params.require(:user).permit(
      :name,
      :email,
      :self_introduction,
      :date_of_birth,
      :sex,
      :game_id,
      :platform
    )
  end
end
