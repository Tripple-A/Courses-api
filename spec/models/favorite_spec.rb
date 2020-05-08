require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let!(:users) { create_list(:user, 1) }
  let(:user_id) { users.first.id }
  let!(:courses) { create_list(:course, 2) }
  let(:course_id) { courses.first.id }

  it 'validates presence of user id' do
    fav = Favorite.new(user_id: '', course_id: course_id).save
    expect(fav).to eq(false)
  end

  it 'validates presence of course id' do
    fav = Favorite.new(user_id: user_id, course_id: '').save
    expect(fav).to eq(false)
  end

  it 'creates a favorite successfully' do
    fav = Favorite.new(user_id: user_id, course_id: course_id).save
    expect(fav).to eq(true)
  end

  it 'has valid associations' do
    fav = Favorite.new(user_id: user_id, course_id: courses.last.id).save
    expect(User.find(user_id).favorite_courses.count).to eql(1)
  end
  
end
