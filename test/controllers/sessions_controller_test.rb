require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "get new" do
    get :new
    assert_response :success
  end

end
