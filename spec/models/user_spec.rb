require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures username presence' do
      user = User.new(username: '', password: '123').save
      expect(user).to eq(false)
    end

    it 'ensures password presence' do
      user = User.new(username: 'username', password: '').save
      expect(user).to eq(false)
    end
  end

  context 'creation and uniqueness test' do
    let!(:users) { create_list(:user, 1) }
    let(:user_username) { users.first.username }
    let(:user1) { users.first }

    it 'creates a user successfully' do
      expect(user1.id.nil?).to eq(false)
    end

    it 'ensures username uniqueness' do
      user2 = User.new(username: user_username, password: '123').save
      expect(user2).to eq(false)
    end
  end
end
