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
    user1 = User.new(username: 'barbey', password: '123').save
    user2 = User.new(username: 'barbey', password: '123').save
    
    it 'creates a user successfully' do
      expect(user1).to eq(true)
    end

    it 'ensures username uniqueness' do
      expect(user2).to eq(false)
    end

  end
end
