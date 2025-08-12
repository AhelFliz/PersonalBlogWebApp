class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  private

  attr_reader :current_user

  def require_login
    redirect_to(login_url) unless current_user
  end

  def require_admin_user
    render_access_denied unless current_user&.admin?
  end

  def render_access_denied
    render(plain: "403 - Access denied", status: :forbidden, content_type: "text/html")
  end

  def authenticate_user
    return unless session[:user_id]

    @current_user = User.find(session[:user_id])
  end
end
