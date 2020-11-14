require 'test_helper'

class MrddsgesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get mrddsges_create_url
    assert_response :success
  end

end
