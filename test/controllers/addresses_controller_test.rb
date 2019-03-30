require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get addresses_create_url
    assert_response :success
  end

end
