require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'adding user to group' do
    let!(:member_group) { FactoryGirl.create(:group) }
    let!(:user) { FactoryGirl.create(:user) }

    it 'should add a group to an user' do
      user.groups << member_group
      expect(user.in_group?(member_group)).to be_truthy
    end

    it 'should add a user to a group' do
      member_group.add user
      expect(user.in_group?(member_group)).to be_truthy
    end

    it 'should be able to add multiple uses at one time' do
      second_user = FactoryGirl.create(:user)
      member_group.add(user, second_user)
      expect(user.in_group?(member_group)).to be_truthy
      expect(second_user.in_group?(member_group)).to be_truthy
    end

    it 'should be able to add an user to multiple groups' do
      second_group = FactoryGirl.create(:group)
      member_group.add user
      second_group.add user
      expect(user.in_group?(member_group)).to be_truthy
      expect(user.in_group?(second_group)).to be_truthy
    end
  end

  context 'removing user from group' do
    let!(:member_group) { FactoryGirl.create(:group) }
    let!(:user) { FactoryGirl.create(:user) }
    before(:each) do
      user.groups << member_group
    end

    it 'should remove a group from an user' do
      user.groups.destroy(member_group)
      expect(user.in_group?(member_group)).to be_falsey
    end

    it 'should remove an user from a group' do
      member_group.users.delete(user)
      expect(user.in_group?(member_group)).to be_falsey
    end

    it 'should be able to delete an user from a single group when a member of multiple groups' do
      second_group = FactoryGirl.create(:group)
      user.groups << second_group
      user.groups.destroy(member_group)
      expect(user.in_group?(member_group)).to be_falsey
      expect(user.in_group?(second_group)).to be_truthy
    end
  end
end
