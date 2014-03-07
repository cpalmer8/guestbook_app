class GuestbookMessagesController < ApplicationController
  def new
    @guestbook_message = GuestbookMessage.new
  end

  def create
    @guestbook_message = current_user.guestbook_messages.build(message_params)
    if @guestbook_message.save
      flash[:success] = "Message created!"
      redirect_to root_url
    else
      flash[:error] = "Oops. Message could not be posted. Message field is required."
      redirect_to root_url
    end
  end

  def destroy
  end

  def show
    @messages = GuestbookMessage.paginate(page: params[:page], :per_page => 10)
    if signed_in?
      @guestbook_message = current_user.guestbook_messages.build
    end
  end

  private
    def message_params
      params.require(:guestbook_message).permit(:message, :location, :time)
    end
end
