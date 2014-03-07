class GuestbookMessagesController < ApplicationController
  def new
    @guestbook_message = GuestbookMessage.new
  end

  def create
    @guestbook_message = current_user.guestbook_messages.build(message_params)
    if @guestbook_message.save
      flash[:success] = "Message created!"
      redirect_to '/home'
    else
      redirect_to '/users/1'
    end
  end

  def destroy
  end

  def show
    @messages = GuestbookMessage.all
    if signed_in?
      @guestbook_message = current_user.guestbook_messages.build
    end
  end

  private
    def message_params
      params.require(:guestbook_message).permit(:message, :location, :time)
    end
end
