require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
     @user = users(:bob)
  end

  test "test for invalid login" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { username: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
    assert_not is_logged_in?
    assert_template 'sessions/new'
  end

  test "test for signup validity" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { username:  "test",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end

    test "test for valid login and logout" do
    get login_path
    post login_path, session: { username: @user.username, password: 'password' }
    assert is_logged_in?
    assert_redirected_to "/home"
    follow_redirect!
    #Go to user profile
    get user_path(@user)
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    #Logging out in a second window.
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

end
