class UsersController < ApplicationController
  protect_from_forgery with: :exception
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def allowed_params
    params.require(:user).permit(:username, :email, :password)
  end
end
