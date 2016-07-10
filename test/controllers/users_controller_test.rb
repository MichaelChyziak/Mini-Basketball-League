require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {username: "user_test", email: "user_test@example.com", password: "usertest", password_confirmation: "usertest"}
    end

    assert_redirected_to user_path(User.last)
    assert_equal "Welcome to Mini Basketball League!", flash[:success]
  end

end
