class Api::ServicesController < ApplicationController
  def index
    @services = Service.order('title desc')
    render json: @services
  end
end
