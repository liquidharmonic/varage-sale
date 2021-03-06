class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_action :rescue_exceptions

  def rescue_exceptions
    yield
  rescue => e
    render message: "Error #{e.class.name} #{e.message}", status: 400
  end
end
