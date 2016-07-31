require 'test_helper'

class MapsControllerTest < ActionController::TestCase

  setup do
    @user = users(:michael)
    @admin = User.create(username: "admin", email: "admin@xyz.com", password: "notadmin", password_confirmation: "notadmin", admin: true, super_admin: true)
  end

  test "should get index" do
    session[:user_id] = @user.id
    get :index
    assert_response :success
  end

  test "should get new" do
    session[:user_id] = @admin.id
    get :new
    assert_response :success
  end

  test "should create map" do
    session[:user_id] = @admin.id
    assert_difference('Map.count') do
      post :create, map: {name: "test", info:"This is a test", lat: "35.6990", lng: "139.7730", league: "vancouver"}
    end

    assert_redirected_to maps_path
  end

end
