class ApplicationController < ActionController::Base
  before_action :cors_set_access_control_headers


  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
