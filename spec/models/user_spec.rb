require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Richard', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Proud dad and rockstar developer') }

  before { subject.save }

  # validation tests
  it 'validates the presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'validates that posts_counter was set' do
    expect(subject).to be_valid
    expect(subject.posts_counter).to eql(0)
  end

  it 'validates the presence of posts_counter' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'validates that posts counter is a positive integer' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  # methods tests
  it 'tests that latest_posts is a valid method' do
    expect(subject.latest_posts).to eql([])
  end
end