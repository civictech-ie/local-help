class Api::ServicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @services = Service.order('title desc')
    render json: @services
  end

  def create
    raise params.inspect
  end
end
