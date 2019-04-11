class RoomsController < ApplicationController
  before_action :authenticate_user!, :set_current_user

  def show
    @messages = Message.all
  end

  private

  def set_current_user
    User.current = current_user
  end
end
