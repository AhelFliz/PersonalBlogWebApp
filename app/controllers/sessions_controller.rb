class SessionsController < ApplicationController
  def create
    user = User.find_by(role: :admin, username: session_params[:username])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id

      redirect_to(articles_path, notice: "Loggd in")
    else
      redirect_to(login_path, alert: "Login Failed")
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to(articles_path, notice: "Logged out")
  end

  private

  def session_params
    params.permit(:username, :password)
  end
end
