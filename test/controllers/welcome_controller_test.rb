require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  def setup
    @user = users(:michael)
    log_in_as(@user)
    assert is_logged_in?
  end
  
  test "should get home" do
    get :home
    assert_response :success
  end
  
  test "should get about" do
    get :about
    assert_response :success
  end
  
  test "should get schedule" do
    get :schedule
    assert_response :success
  end
  
  
  
end
