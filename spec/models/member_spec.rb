require 'rails_helper'

RSpec.describe Member, type: :model do
  describe Member do
    describe '#create' do
      it 'is valid with group and user' do
        user = buiid(:user)
        group = build(:group)
        group.valid? && user.valid?
        expect(user).to be_valid 
        expect(group).to be_valid
      end
    end
  end
end
