require 'rails_helper'
RSpec.describe User, :type => :model do
  before(:all) do
    @user1 = create(:user)
  end
  it "is valid when built from factory" do
    expect(@user1).to be_valid
  end
  it "is valid when build from random factory" do
    user2 = build(:random_user)
    expect(user2).to be_valid
  end
  it "has a unique email" do
    user2 = build(:user)
    expect(user2).to_not be_valid
  end
  it "is not valid without a password" do
    user2 = build(:random_user, password: nil)
    expect(user2).to_not be_valid
  end
  it "is not valid without an email" do
    user2 = build(:random_user, email: nil)
    expect(user2).to_not be_valid
  end
  it "is not valid when password is shorter than 6" do
    user2 = build(:random_user, password: "12345")
    expect(user2).to_not be_valid
  end
  it "is not valid when email is without @" do
    email = "alamakota"
    expect(email).not_to match(/^\w+@\w+$/)
    user2 = build(:random_user, email: email)
    expect(user2).to_not be_valid
  end
  it "is valid when pesel is blank" do
    user2 = build(:random_user, pesel: nil)
    expect(user2).to be_valid
  end
  it "is not valid when pesel is shorter than 11" do
    pesel = "12345"
    expect(pesel).not_to match(/^\d{11}$/)
    user2 = build(:random_user, pesel: pesel)
    expect(user2).to_not be_valid
  end
end