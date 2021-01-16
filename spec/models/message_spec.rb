require 'rails_helper'

RSpec.describe Message, type: :model do
  context "with valid params" do
    it "creates a message" do
      expect { create(:message) }.to not_raise_error
      .and change { Message.count }.by(1)
    end
  end

  context "with invalid params" do
    context "with invalid email" do
      it "doesn't freaking work" do
        expect { create(:message, :invalid) }.to raise_error(ActiveRecord::RecordInvalid)
      .and not_change { Message.count }
      end
    end
  end
end
