require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:bob)
  end

  test "correct user returned for nil session" do
    assert_equal current_user, @user
    assert is_logged_in?
  end

end
