class Api::ServicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @services = Service.order('title desc')
    render json: @services
  end
  
  def create
    @service = Service.new(service_params)
    @service.suggested_at = Time.now
    if @service.save
      render json: {status: 'ok'}
    else
      render json: {service: @service}, status: 422
    end
  end

  private

  def service_params
    params.require(:service).permit(:description, :organisation, :address_line_1, :address_line_2, :address_city, :address_county, :address_postcode, :contact_name, :contact_number, :contact_email, :contact_url)
  end
end
