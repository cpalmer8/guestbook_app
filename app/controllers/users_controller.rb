class UsersController < ApplicationController
  require 'will_paginate/array'
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the guestbook app!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # Uses will_paginate on the guestbook_messages variable so that each user's page 
  # has their posts.
  def show
    @user = User.find(params[:id])
    @guestbook_messages = @user.guestbook_messages
    @guestbook_messages = @guestbook_messages.paginate(:page => params[:page], :per_page => 10)
  end

  def edit
    if signed_in?
      @user = User.find(current_user.id)
    else
      flash[:error] = "You are not logged in."
      redirect_to root_url
    end
  end

  def update
    if signed_in?
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "Account updated."
        redirect_to @user
      else
        render 'edit'
      end
    else
      flash[:error] = "You are not logged in."
      redirect_to root_url
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :location, :password, :password_confirmation)
    end
end
