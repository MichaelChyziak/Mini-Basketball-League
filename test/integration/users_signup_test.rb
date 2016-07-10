require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "signup info - invalid" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { username:  "",
                                         email: "user@invalid",
                                         password:              "123",
                                         password_confirmation: "abc" } }
    end
    assert_template 'users/new'
  end

  test "signup info - valid" do
      get signup_path
      assert_difference 'User.count', 1 do
        post users_path, params: { user: { username:  "User1",
                                           email: "user@example.com",
                                           password:              "useruser",
                                           password_confirmation: "useruser" } }
      end
      follow_redirect!
      assert_template 'users/show'
    end


end
