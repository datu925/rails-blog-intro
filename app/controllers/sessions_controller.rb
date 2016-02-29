class SessionsController < ApplicationController
  def register_page
    @user = User.new
    render "register"
  end

  def register
    @user = User.create(user_params)
    redirect_to "/"
  end

  def login_page
    render "login"
  end

  def login
    user = User.find_by(email: params[:email])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to :back
    end
  end

  def logout
    session[:user_id] = nil
    render "logout"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end