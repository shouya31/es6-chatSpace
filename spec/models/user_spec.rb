require 'rails_helper'

describe User do
  describe '#create' do
    let(:user) do
      FactoryBot.build(:user)
    end

    context "in case that it is invalid" do
      it "is invalid without a name" do
        user.name = ""
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end
  
      it "is invalid without a email" do
        user.email = ""
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
  
      it "is invalid without a password" do
        user.password = ""
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
  
      it "is invalid without a password_confirmation although with a password" do
        user.password_confirmation = ""
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
  
      it "is invalid with a duplicate email address" do
        user.save!
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
  
      it "is invalid with a name that has more than 11 characters " do
        user.name = "s" * 11
        user.valid?
        expect(user.errors[:name][0]).to include("is too long")
      end

      it "is invalid with a password that has less than 5 characters " do
        user.password = "s" * 5
        user.password_confirmation = "s" * 5
        user.valid?
        expect(user.errors[:password][0]).to include("is too short")
      end
    end

    context "in case that it is valid" do
      it "is valid with a nickname, email, password, password_confirmation" do
        expect(user).to be_valid
      end
  
      it "is valid with a nickname that has less than 6 characters " do
        user.name = "s" * 6
        expect(user).to be_valid
      end
    end
  end
end