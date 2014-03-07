require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user name should exist" do
    user = users(:blank_name)
    assert !user.save, "Name cannot be blank."
  end

  test "email should exist" do
    user = users(:blank_email)
    assert !user.save, "Email cannot be blank."
  end

  test "email should match regex" do
    user = users(:invalid_email)
    assert !user.save, "Invalid regex."
  end
end
