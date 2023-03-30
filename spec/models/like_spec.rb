require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.new(name: 'Jack Sparrow', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                     bio: 'I\'m Captain Jack Sparrow!', posts_counter: 0)
    @post = Post.new(author: @user, title: 'I got a new monitor!', text: 'My productivity has been at an all time high')
  end
  subject { Like.new(user: @user, post: @post) }

  before { subject.save }

  # methods tests
  it 'should add the comment to the comment_counter of the post' do
    expect(@post.likes_counter).to eql(1)
  end
end
