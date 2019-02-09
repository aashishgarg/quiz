require 'rails_helper'

RSpec.describe User, type: :model do
  context '#Validations' do
    it 'validates presence of email' do
      user = User.create(name: 'user1', password: 'Welcome@123', password_confirmation: 'Welcome@123')
      expect(user.valid?).not_to eq(true)
      expect(user.errors[:email].include?("can't be blank")).to eq(true)
    end

    it 'validates uniqueness of email' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.build(:user, email: user1.email)
      expect(user2.valid?).to_not eq(true)
      expect(user2.errors[:email].include?("has already been taken")).to eq(true)
    end

    it 'validates presence of name' do
      user = User.create(email: 'a@a.com', password: 'Welcome@123', password_confirmation: 'Welcome@123')
      expect(user.valid?).not_to eq(true)
      expect(user.errors[:name].include?("can't be blank")).to eq(true)
    end

    context '#Length' do
      it 'validates minimum length = 2 for name' do
        user = FactoryBot.build(:user, name: 'a')
        expect(user.valid?).to eq(false)
        expect(user.errors.key?(:name)).to eq(true)
      end

      it 'validates maximum length = 199 for name' do
        user = FactoryBot.build(:user, name: 'a' * 200)
        expect(user.valid?).to eq(false)
        expect(user.errors.key?(:name)).to eq(true)
      end
    end
  end
end
