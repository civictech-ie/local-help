class Api::ServicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @services = services_for_scope(scope_params).order('title asc')
    render json: @services
  end
  
  def create # suggest
    @service = Service.new(service_params)
    @service.suggested_at = Time.now
    if @service.save
      render json: {status: 'ok'}
    else
      render json: {service: @service, errors: @service.errors}, status: 422
    end
  end

  private

  def services_for_scope(scope_params)
    services = Service.published
    if scope_params[:area].present?
      services = services.for_area(scope_params[:area])
    end
    if scope_params[:category].present?
      services = services.for_category(scope_params[:category])
    end
    services
  end

  def scope_params
    params.permit(:area, :category)
  end

  def service_params
    params.require(:service).permit(:description, :organisation, :address_line_1, :address_line_2, :address_city, :address_county, :address_postcode, :contact_name, :contact_number, :contact_email, :contact_url)
  end
end
