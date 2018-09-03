require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  def setup
    @room = Room.new(name: "メイン部屋", description: "メインで使用する部屋")
  end

  test "should permit blank description" do
    @room.description = "   　"
    assert @room.valid?
  end

  test "should permit nil description" do
    @room.description = nil
    assert @room.valid?
  end

  test "name should be at most 30 characters" do
    @room.description = "あいう" * 10 # 30 characters
    assert @room.valid?

    @room.description = "あいう" * 10 + "え" # 31 characters
    assert_not @room.valid?
  end
end
