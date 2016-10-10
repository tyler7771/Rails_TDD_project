require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe "test validations" do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:details)}
    it { should validate_presence_of(:user_id)}
    it { should belong_to(:user)}
  end
end
