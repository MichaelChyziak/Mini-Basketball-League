require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "get new" do
    get :new
    assert_response :success
  end

  test "create user" do
    assert_difference('User.count') do
      post :create, user: {username: "test", email: "test@example.com", password: "test", password_confirmation: "test"}
  end

  test "redirect" do 
    assert_redirected_to user_path(User.last)
    assert_equal "Welcome to Mini Basketball League!", flash[:success]
  end

end
