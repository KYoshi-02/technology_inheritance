class ApplicationController < ActionController::Base
  before_action :basic_auth

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
