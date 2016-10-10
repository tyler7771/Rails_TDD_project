require 'rails_helper'

RSpec.describe User, type: :model do
  describe "password encryption" do
    it "creates BCrypt password" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "john", password: "123456")
    end

    it "does not save password" do
      User.create(username: "Jim", password: "123456")
      user = User.find_by(username: "Jim")
      expect(user.password).not_to be("123456")
    end
  end

  describe "session token" do
    it "sets session_token" do
      user = User.create(username: "Dan", password: "123456")
      expect(user.session_token).not_to be_nil
    end
  end


  describe "test validations" do
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:session_token)}
    it { should validate_presence_of(:password_digest)}
    it { should have_many(:goals)}
    it { should validate_length_of(:password).is_at_least(6)}
  end
end
