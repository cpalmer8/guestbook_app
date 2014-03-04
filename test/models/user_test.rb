require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user name and email should exist" do
    user = User.new
    assert !user.save
  end
end
