class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user=(user)
    @current_user = user
  end
end
