class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if password?
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:password, :name, :height, :happiness, :nausea, :tickets)
  end

end
