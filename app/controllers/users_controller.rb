class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]
  def index
  end

  def create
    user = User.find_by_email(user_params['email'])
    if user && user.authenticate(user_params['password'])
      render json: {token: token(user.id), user_id: user.id}, status: :created
    else
      render json: {errors: 'User Not Found!!'}, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def user_params
    params.permit(:user_name, :password, :email, :mobile)
  end
end
