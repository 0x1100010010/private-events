class SessionsController < ApplicationController
  # before_action :set_user, only: %i[ create destroy ]

  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Signed in successfully!"
    else
      flash.now[:alert] = "Username is invalid"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Signed out successfully!"
  end

end
