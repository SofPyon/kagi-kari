require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(screen_name: "hoge", name: "ほげ太郎", password: "hogehoge",
                     password_confirmation: "hogehoge")
  end

  test "should valid" do
    assert @user.valid?
  end

  test "screen_name should be present" do
    @user.screen_name = "   "
    assert_not @user.valid?
  end

  test "name should be present" do
    @user.name = "　　"
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = " " * 8
    assert_not @user.valid?
  end

  test "password_confirmation should be same as password" do
    @user.password_confirmation = "togetoge"
    assert_not @user.valid?
  end

  test "screen_name should be at least 3 characters" do
    @user.screen_name = "ho"
    assert_not @user.valid?

    @user.screen_name = "hog"
    assert @user.valid?
  end

  test "screen_name should be at most 20 characters" do
    @user.screen_name = "a" * 20
    assert @user.valid?

    @user.screen_name = "a" * 21
    assert_not @user.valid?
  end

  test "name should be at most 20 characters" do
    @user.screen_name = "あ" * 20
    assert @user.valid?

    @user.screen_name = "あ" * 21
    assert_not @user.valid?
  end

  test "password should be at least 8 characters" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?

    @user.password = @user.password_confirmation = "a" * 8
    assert @user.valid?
  end
end
