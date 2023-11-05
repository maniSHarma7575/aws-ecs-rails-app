class HomeController < ApplicationController
  def index
    render json: { "message": "welcome" }
    HomeJob.perform_later
  end
end
