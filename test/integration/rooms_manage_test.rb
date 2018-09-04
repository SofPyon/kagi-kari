require 'test_helper'

class RoomsManageTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:john)
  end

  test "should redirect without logged in" do
    get rooms_path
    assert_redirected_to new_session_path
    assert_not flash[:danger].empty?
  end

  test "create room with valid info" do
    log_in_as(@user)
    get new_room_path
    name = "Foobar Room"
    post rooms_path, params: { room: { name: name,
                                       description: "Lorem ipsum." } }
    assert_redirected_to rooms_path
    assert_not flash[:success].empty?
    follow_redirect!
    assert_match name, response.body
  end

  test "create room with invalid info" do
    log_in_as(@user)
    get new_room_path
    post rooms_path, params: { room: { name: "",
                                       description: "Lorem ipsum." } }
    assert_template "rooms/new"
    assert_match "invalid-feedback", response.body
  end

  test "should see all rooms" do
    log_in_as(@user)
    get rooms_path
    Room.all.each do |room|
      assert_match CGI.escapeHTML(room.name), response.body
      assert_match CGI.escapeHTML(room.description), response.body
      assert_select 'a[href=?]', edit_room_path(room), text: "Edit"
      assert_select 'a[href=?]', room_path(room),      text: "Destroy"
    end
  end

  test "edit room with valid info" do
    log_in_as(@user)
    room = rooms(:main_room)
    get edit_room_path(room)
    name = "Edited Main Room"
    patch room_path(room), params: { room: { name: name,
                                             description: "foobar foobar." } }
    assert_redirected_to rooms_path
    assert_not flash[:success].empty?   
    follow_redirect!
    assert_match name, response.body                                      
  end

  test "destroy room" do
    log_in_as(@user)
    room = rooms(:main_room)
    assert_difference 'Room.count', -1 do
      delete room_path(room)
    end
  end
end
