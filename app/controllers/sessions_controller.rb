class SessionsController < ApplicationController

  def new
  end

  def create
    binding.pry
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path, alert: "Incorrect name or password"
    end
  end

end
