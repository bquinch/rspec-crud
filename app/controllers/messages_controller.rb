class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)

    if @message.valid?
      @message.save
      MessageMailer.contact(@message).deliver_now
      render json: @message,
             each_serializer: MessageSerializer,
             root: :message,
             status: 200
    else
      render json: { message: "Invalid email", code: 400 }, status: 400
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :from, :subject, :content)
  end
end
