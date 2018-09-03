require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test "full_title helper" do
    assert_equal full_title, "Kagikari"
    assert_equal full_title("Status"), "Status | Kagikari"
  end
end