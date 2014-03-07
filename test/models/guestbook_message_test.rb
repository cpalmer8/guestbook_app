require 'test_helper'

class GuestbookMessageTest < ActiveSupport::TestCase
  test "message should not be blank" do
    message = guestbook_messages(:blank_message)
    assert !message.save, "Message cannot be blank."
  end

  test "location should not be blank" do
    message = guestbook_messages(:blank_location)
    assert !message.save, "Message must have location."
  end

  test "user cannot be null" do
    message = guestbook_messages(:null_user)
    assert !message.save, "User must be logged in."
  end
end
