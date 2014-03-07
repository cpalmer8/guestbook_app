class GuestbookMessage < ActiveRecord::Base
  belongs_to :user
  validates :message, presence: true, length: { maximum: 400 }
  validates :user_id, presence: true
  validates :location, presence: true
end
