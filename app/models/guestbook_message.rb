class GuestbookMessage < ActiveRecord::Base
  belongs_to :user
  validates :message, presence: true, length: { maximum: 450 }
  validates :location, presence: true
  validates :user_id, presence: true
end
