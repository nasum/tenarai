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

  describe "#create" do
    context "when duplicate name" do
      before { create(:user, name: 'name') }
      let (:user) { build(:user, name: 'name') }

      it "don`t save user" do
        expect(user.save).to be_falsey
      end
    end

    context "when duplicate email" do
      before { create(:user, email: 'hoge@hoge.com') }
      let (:user) { build(:user, email: 'hoge@hoge.com') }

      it "don`t save user" do
        expect(user.save).to be_falsey
      end
    end
  end
end
