require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root with logged in" do
    log_in_as(users(:john))
    get root_path
    assert_response :success
  end

end
