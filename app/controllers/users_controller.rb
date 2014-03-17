class UsersController < ApplicationController
  respond_to :json

  def create
    @user = User.create(user_params)
    respond_with @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
