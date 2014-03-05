class GuestbookMessagesController < ApplicationController
  def new
    @message = GuestbookMessage.new
  end

  def create
    @message = GuestbookMessage.new(params[:message])
    if @message.save
      flash[:success] = "Message created!"
      redirect_to '/home'
    else
      render 'new'
    end
  end

  def destroy
  end

  def show
    @messages = GuestbookMessage.all
    @message ||= GuestbookMessage.new
  end
end
