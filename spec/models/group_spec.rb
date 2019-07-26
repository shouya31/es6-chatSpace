require 'rails_helper'

RSpec.describe Group, type: :model do
  describe Group do
    describe '#create' do
      let(:group) do
        FactoryBot.build(:group)
      end
      
      it 'is invalid without name' do
        group.name = ""
        group.valid?
        expect(group.errors[:name]).to include("can't be blank")
      end
      it 'is require that less than 3 characters' do
        group.name = "s" * 2
        group.valid?
        expect(group.errors[:name][0]).to include("is too short")
      end
      it 'is invalid when you write more than 16 character as name' do
        group.name = "a" * 16
        group.valid?
        expect(group.errors[:name][0]).to include("is too long")
      end
      it 'is invalid with a duplicate group_name' do
        group.save!
        another_group = build(:group, name: group.name)
        another_group.valid?
        expect(another_group.errors[:name]).to include("has already been taken")
      end
    end
  end
end
