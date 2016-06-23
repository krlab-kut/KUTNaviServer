class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  $congestion_info = [
                        {place_id: 1, counter: 0},
                        {place_id: 2, counter: 0}
                      ]

  protect_from_forgery with: :null_session
end
