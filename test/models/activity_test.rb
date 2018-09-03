require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  def setup
    @borrow_main = activities(:borrow_main)
    @return_main = activities(:return_main)
    @borrow_sub  = activities(:borrow_sub)
  end

  test "should be valid" do
    assert @borrow_main.valid?
    assert @return_main.valid?
    assert @borrow_sub.valid?
  end

  test "action should be present" do
    @borrow_main.action = nil
    assert_not @borrow_main.valid?
  end

  test "action should be behaved as enum" do
    assert @borrow_main.borrowing?
    assert @return_main.returning?
    assert @borrow_sub.borrowing?
  end
end
