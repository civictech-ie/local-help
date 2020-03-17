require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  test "is filterable by area" do
    service = services(:valid)
    service.areas << "Dublin 8"
    service.areas << "Dublin 7"
    service.save!

    assert service.available_in?("Dublin 8")
    assert_not service.available_in?("Dublin 6")

    assert Service.for_area("Dublin 8").include?(service)
    assert_not Service.for_area("Dublin 6").include?(service)
  end

  test "normalises arrays" do
    service = services(:valid)
    service.areas = nil
    service.categories = nil
    service.save!
    
    assert service.areas.is_a?(Array)
    assert service.categories.is_a?(Array)
    assert_equal service.areas.count, 0
    assert_equal service.categories.count, 0
  end
end
