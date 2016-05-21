class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  $test_info = [{place_id: 0, test_counter: 0},
                {place_id: 1, test_counter: 0}]
  protect_from_forgery with: :exception
end
