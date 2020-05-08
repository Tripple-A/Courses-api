require 'rails_helper'

RSpec.describe Course, type: :model do
  let!(:courses) { create_list(:course, 2) }
  let(:course_id) { courses.first.id }

  it 'creates a course successfully' do
    expect(Course.find(course_id)).to eq(courses.first)
  end


end
