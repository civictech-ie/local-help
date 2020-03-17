class Admin::ServicesController < Admin::ApplicationController
  def index
    @services = Service.order('created_at desc')
  end
end
