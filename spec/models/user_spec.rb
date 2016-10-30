require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#new" do
    context "when all column fill" do
      let (:user) { build(:user) }
      it "should fill encrypted_password" do
        user.save
        expect(user.crypted_password).not_to be_nil
      end
    end
  end
end
