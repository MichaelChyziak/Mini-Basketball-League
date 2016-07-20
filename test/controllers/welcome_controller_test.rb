require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  def setup
    @user = User.create(username:"ray",email:"ray@example.com",password:'password',admin:true)
  end
#when logged in
  test "should get home" do
    session[:user_id] = @user.id
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get shedule" do
    session[:user_id] = @user.id
    get :schedule
    assert_response :success
  end

  test "should get shedule2" do
    session[:user_id] = @user.id
    get :schedule2
    assert_response :success
  end

  test "should get shedule3" do
    session[:user_id] = @user.id
    get :schedule3
    assert_response :success
  end

  test "should get standings" do
    session[:user_id] = @user.id
    get :standings
    assert_response :success
  end

#not logged in

  test "should not get home" do
    get :home
    assert_redirected_to root_path
  end

  test "should STILL get about" do
    get :about
    assert_response :success
  end

  test "should not get shedule" do
    get :schedule
    assert_redirected_to root_path
  end

  test "should not get shedule2" do
    get :schedule2
    assert_redirected_to root_path
  end

  test "should not get shedule3" do
    get :schedule3
    assert_redirected_to root_path
  end

  test "should not get standings" do
    get :standings
    assert_redirected_to root_path
  end


end
