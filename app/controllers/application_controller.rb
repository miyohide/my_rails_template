class ApplicationController < ActionController::Base
  # controllerにて出力するメッセージの種類をbootstrapのalertの種類に合わせた
  # 参考 https://api.rubyonrails.org/classes/ActionController/Flash/ClassMethods.html
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
