require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:john)
  end

  test "invalid login info" do
    get new_session_path

    assert_template "sessions/new"

    post sessions_path, params: { session: { screen_name: "", password: "" } }
    assert_redirected_to new_session_path
    assert_not flash[:danger].empty?
  end

  test "valid login info" do
    get new_session_path
    post sessions_path, params { session: { screen_name: @user.screen_name,
                                            password:    @user.password } }
    assert_redirected_to root_path
    assert_not flash[:success].empty?
  end
end
