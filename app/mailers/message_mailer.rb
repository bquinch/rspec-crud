class MessageMailer < ApplicationMailer
  def contact(message)
    @name = message.name
    @message = message
    message_params = {
      from: ENV["DEVELOPER_EMAIL_ADDRESS"],
      to: ENV["DEVELOPER_EMAIL_ADDRESS"],
      subject: message.subject,
      text: message.content,
      reply_to: message.from,
    }
    mail(message_params)
  end
end
