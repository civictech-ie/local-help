class Admin::ServicesController < Admin::ApplicationController
  def index
    @services = Service.order('created_at desc')
  end

  def new
    @service = Service.new
  end
  
  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to [:admin, :services]
    else
      render :new
    end
  end

  def edit
    @service = Service.find_by(hashed_id: params[:id])
  end

  def update
    @service = Service.find_by(hashed_id: params[:id])
    if @service.update(service_params)
      redirect_to [:admin, :services]
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find_by(hashed_id: params[:id])
    @service.destroy!
    redirect_to [:admin, :services]
  end

  private

  def service_params
    params.require(:service).permit(:title, :description, :areas_str, :categories_str, :address_line_1, :address_line_2, :address_city, :address_county, :address_postcode, :contact_name, :contact_number, :contact_email, :contact_url)
  end
end

