class MessagesController < ApplicationController
  include ApplicationHelper

  def index
    @messages = Message.recent_by_number.by_date
  end



  def create
    message = Message.new(clean_params)
    message.inbound = false

    if message.save
      send_cable(message)
      send_sms(message)
    end
  end

  private

  def clean_params
    params.require(:message).permit(:number, :text)
  end
end
