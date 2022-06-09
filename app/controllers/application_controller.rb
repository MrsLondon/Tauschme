class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def default_url_options
    { host: ENV["www.tauschme.com"] || "localhost:3000" }
  end
end
