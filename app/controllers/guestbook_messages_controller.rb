class GuestbookMessagesController < ApplicationController
  def new
    @guestbook_message = GuestbookMessage.new
  end

  def create
    # Creates the message based on the passed-in params, with current user's ID
    @guestbook_message = current_user.guestbook_messages.build(message_params)
    if @guestbook_message.save
      flash[:success] = "Message created!"
      redirect_to root_url
    else
      # The only field they could've not filled in is the message field, so this is
      # a pretty safe error message. 
      flash[:error] = "Oops. Message could not be posted. Message field is required."
      redirect_to root_url
    end
  end

  def destroy
  end

  def show
    # If the user is signed in, pass in the variable used in rendering the partial to
    # create a message.
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
