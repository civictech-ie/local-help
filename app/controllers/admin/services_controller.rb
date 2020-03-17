class Admin::ServicesController < Admin::ApplicationController
  def index
    @services = Service.order('created_at desc')
  end

  def new
    @service = Service.new
  end
  
  def create

  end

  def edit

  end

  def update

  end
end
