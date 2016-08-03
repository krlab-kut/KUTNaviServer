require 'gcm'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  $gcm = GCM.new("AIzaSyBln4YyKBgjB4ZYx82XQ3ijgpH0kuPsBWE")
  #Dummy
  $congestion_info = {
                        congestions:
                        [
                          {place_id: 1, counter: 10},
                          {place_id: 2, counter: 5}
                        ]
                     }


  protect_from_forgery with: :null_session
end
