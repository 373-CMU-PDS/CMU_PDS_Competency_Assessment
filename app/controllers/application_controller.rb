class ApplicationController < ActionController::Base
  include AssessmentHelpers::Authentication
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in_user?

  # The functions check_authentication and logged_in_user? are
  # used in the controllers and views associated with the administrator's
  # dashboard.

  private
  # authenticate_user and islogged_in? are helper functions from
  # /lib/helpers/authenitcation.rb
  def check_authentication
      authenticate_user
  end

  def logged_in_user?
    return is_logged_in?
  end

end
