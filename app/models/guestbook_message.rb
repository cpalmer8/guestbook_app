class GuestbookMessage < ActiveRecord::Base
  belongs_to :user
  validates :message, presence: true, length: { maximum: 400 }
  validates :user_id, presence: true
  validates :location, presence: true
  
  def send_nightly_messages
    @messages = GuestbookMessage.find(:all, :conditions => [" created_at between ? AND ?", 
                                                           Time.zone.now.beginning_of_day, Time.zone.now.end_of_day])
    MessagesMailer.nightly_messages(@messages)
  end
end
