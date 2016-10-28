class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :allow_iframe

  def allow_iframe
    response.headers.delete "X-Frame-Options"
  end
end
