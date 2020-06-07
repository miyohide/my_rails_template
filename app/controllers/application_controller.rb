class ApplicationController < ActionController::Base
  before_action :require_login, :set_session_info

  private
  # セッションにダミーデータを設定する
  def set_session_info
    session[:session_info] = "foo bar"
  end

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
