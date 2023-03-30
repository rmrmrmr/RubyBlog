require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.new(name: 'Jack Sparrow', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                     bio: 'I\'m Captain Jack Sparrow!', posts_counter: 0)
  end
  subject do
    Post.new(author: @user, title: 'I got a new monitor!', text: 'My productivity has been at an all time high')
  end

  before { subject.save }

  # validation tests
  it 'validates that comments_counter has been set' do
    expect(subject).to be_valid
    expect(subject.comments_counter).to eql(0)
  end

  it 'validates that likes_counter has been set' do
    expect(subject).to be_valid
    expect(subject.likes_counter).to eql(0)
  end

  it 'validates the presence of title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'validates that comments_counter is a positive integer' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'validates that likes_counter is a positive integer' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'validates that title is less than 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  # mehtods tests
  it 'tests that latest_comments is a valid method' do
    expect(subject.latest_comments).to eql([])
  end

  it 'should add the post to the posts_counter of the author' do
    expect(@user.posts_counter).to eql(1)
  end
end
