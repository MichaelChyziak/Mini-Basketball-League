require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "test", email: "test@example.com",
                     password: "test", password_confirmation: "test")
  end

  test "test valid" do
    assert @user.valid?
  end

#tests to ensure fields are not blank

  test "test for existence of name" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "test for existence of email" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "test for existence of password" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

#tests for min/max lengths

  test "test for max name length" do
    @user.username = "a" * 50
    assert_not @user.valid?
  end

  test "test for max email length" do
    @user.email = "a" * 200 + "@example.com"
    assert_not @user.valid?
  end

  test "test for min password length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

#tests for uniqueness

  test "test for unique email addresses" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "test for unique usernames" do
    duplicate_user = @user.dup
    duplicate_user.username = @user.username.upcase
    @user.save
    assert_not duplicate_user.valid?
  end


  test "do not accept invalid email addresses" do
    invalid_addresses = %w[test@example,com user_at_test_web.com user.name@example.
                           test_email@test_web.com foo@test_web.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end


  

  
end
