require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  def setup
    @borrow_main = activities(:borrow_main) # 1. Borrow main
    @return_main = activities(:return_main) # 2. Return main
    @borrow_sub  = activities(:borrow_sub)  # 3. Borrow sub
  end

  # These tests are run after step 3 done.
  # In other words:
  #  - Main room : Already returned
  #  - Sub room  : Borrowing

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
