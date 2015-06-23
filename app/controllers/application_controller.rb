class ApplicationController < ActionController::Base
  include ApplicationHelper # I know i showed this, but it's not typically done.  But yeah, you _can_ do it.   Both of your methods in there would probably be appropriate in the Controller anyway.
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
