require "rails_helper"

RSpec.describe "Users Index View", type: :view do
  let(:user) { create(:user) }
  it "renders the users" do
    assign(:users, [user])
    render template: "users/index.html.erb"
    expect(rendered).to include(user.name)
  end
end
