class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def not_authenticated
    raise ActionController::RoutingError.new('Not Found')
  end
end
