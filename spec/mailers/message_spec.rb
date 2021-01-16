require "rails_helper"

RSpec.describe MessageMailer, type: :mailer do
  let(:message) { create(:message) }
  let(:mail) { MessageMailer.contact(message) }

  context "with a valid message" do
    it "sends a message" do
      expect(mail.reply_to).to eq([message.from])
      expect(mail.to).to eq([ENV["DEVELOPER_EMAIL_ADDRESS"]])
    end
  end
end
