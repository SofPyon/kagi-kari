require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:john)
    log_in_as(@user)
  end

  test "should get index" do
    get rooms_path
    assert_response :success
  end

  test "should get new" do
    get new_room_path
    assert_response :success
  end

  test "should get edit" do
    get edit_room_path(rooms(:main_room))
    assert_response :success
  end

end
