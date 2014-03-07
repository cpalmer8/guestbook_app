class MessagesMailer < ActionMailer::Base
  default from: "from@example.com"

  def nightly_messages(messages)
    mail(to: 'c.elena.palmer@outlook.com', subject: 'Nightly Message Report', body: messages)
  end
end
