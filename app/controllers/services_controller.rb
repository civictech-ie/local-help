class ServicesController < ApplicationController
  def index
    @services = Service.order('title desc')
  end
end
