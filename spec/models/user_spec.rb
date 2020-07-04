require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, :basile, :vieux) }

  it "has a name" do
    expect(user).to respond_to(:name)
  end

  it "has an age" do
    expect(user).to respond_to(:age)
  end

  it "should have a name" do
    expect(user.name).to eq("Basile")
    expect(user.name).to be_a(String)
    user.name = nil
    expect(user).to_not be_valid
    user.name = "Coralie"
    expect(user).to be_valid
  end

  it "should have an age" do
    expect(user.age).to eq(90)
    expect(user.age).to be_an(Integer)
    expect(user).to be_valid
    user.age = nil
    expect(user).to_not be_valid
  end

  it "should have an email" do
    expect(user.email).to eq("george@abitbol.com")
    expect(user.email).to be_a(String)
    expect(user).to be_valid
    expect(user.email).to match(/\A[^@\s]+@[^@\s]+\z/)
    user.email = nil
    expect(user).to_not be_valid
  end

  it "should have an password" do
    expect(user.password).to eq("jaimeleslapins")
    expect(user.password).to be_a(String)
    expect(user).to be_valid
    user.password = nil
    expect(user).to_not be_valid
  end

  it "has a uniq name" do
    user.save
    user2 = User.new(name: "Basile", age: 15)
    expect(user2).to_not be_valid
  end

  it "has a name longer than 4 characters" do
    user.name = "Bob"
    expect(user).to_not be_valid
  end
end
