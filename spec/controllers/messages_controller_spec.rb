require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:message_params) { { from: "basile.quinchon@gmail.com", name: "Basile", subject: "Lolo", content: "Lala" } }

  describe "POST #create" do
    context "with valid params" do
      it "creates a message and enqueues de mail delivery job" do
        expect {
          post :create, params: { message: message_params }
        }.to change { Message.count }.by(1)
        .and change { ActionMailer::Base.deliveries.count }.by(1)
        expect(response.body).to include(message_params[:name])
        expect(response.body).to include(message_params[:subject])
        expect(response.body).to include(message_params[:from])
      end
    end

    context "with invalid params" do
      it "doesn't do shit" do
        message_params[:from] = "lololo"
        expect {
          post :create, params: { message: message_params }
        }.to not_change { Message.count }
        .and not_change { ActionMailer::Base.deliveries.count }
        expect(response.status).to eq(400)
        expect(JSON.parse(response.body)["message"]).to eq("Invalid email")
      end
    end
  end
end
