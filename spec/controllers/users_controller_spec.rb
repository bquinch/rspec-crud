require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_params) do
    {
      name: "Etienne",
      age: 40,
      email: "jojo@rabbit.com",
      password: "super"
    }
  end

  let(:invalid_params) do
    {
      name: "Etienne",
      age: 40
    }
  end

  let(:new_params) do
    {
      name: "Jackie"
    }
  end

  let(:invalid_new_params) do
    {
      name: "Bob"
    }
  end

  describe "GET #index" do

    it "shows the list of all users" do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
      expect(assigns(:users)).to eq([user])
    end

  end

  describe "GET #show" do

    it "shows a user with valid id" do
      get :show, params: { id: user.id }
      expect(response.status).to eq(200)
      expect(assigns(:user)).to eq(user)
      expect(response).to render_template(:show)
    end

    it "renders an error when invalid id" do
      expect { get :show, params: { id: 99 } }.to raise_error ActiveRecord::RecordNotFound
    end

  end

  describe "POST #create" do

    it "creates a user with valid params" do
      expect {
        post :create, params: { user: valid_params }
      }.to change(User, :count).by(1)
      expect(response.status).to eq(302)
      expect(assigns(:user)).to be_a(User)
      expect(assigns(:user)).to be_valid
      expect(response).to redirect_to(user_path(User.last))
    end

    it "doesn't create a user when invalid params" do
      expect {
        post :create, params: { user: invalid_params }
      }.to_not change(User, :count)
      expect(response.status).to eq(200)
      expect(assigns(:user)).to_not be_valid
      expect(response).to render_template(:index)
    end

  end

  describe "PATCH #update" do

    it "updates a user" do
      patch :update, params: { id: user.id, user: new_params }
      expect(response.status).to eq(302)
      expect(response).to redirect_to(user_path(user))
      expect(assigns(:user).name).to eq(new_params[:name])
    end

    it "doesn't update when invalid params" do
      patch :update, params: { id: user.id, user: invalid_new_params }
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
      expect(assigns(:user)).to_not be_valid
    end

  end

  describe "DELETE #destroy" do

    it "deletes a user" do
      new_user = User.create!(valid_params)
      expect {
        delete :destroy, params: { id: new_user.id }
      }.to change(User, :count).by(-1)
      expect(response.status).to eq(302)
      expect(response).to redirect_to(users_path)
    end

  end
end
