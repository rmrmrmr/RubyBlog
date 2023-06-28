require 'rails_helper'

RSpec.describe 'Posts Index', type: :feature do
  scenario 'Shows the users profile picture' do
    visit user_posts_path(1)
    expect(page).to have_selector('img[src="https://unsplash.com/photos/F_-0BxGuVvo"]')
  end

  scenario 'Shows the users username' do
    visit user_posts_path(1)
    expect(page).to have_content('Tom')
  end

  scenario 'Shows the number of posts the user has written' do
    visit user_posts_path(1)
    expect(page).to have_content('Number of posts: 4')
  end

  scenario "Shows a post's title" do
    visit user_posts_path(1)
    expect(page).to have_selector('.title-identifier')
  end

  scenario 'Show the content of a post' do
    visit user_posts_path(1)
    expect(page).to have_content('This is my first post')
  end

  scenario 'Show some of the comments for each post' do
    visit user_posts_path(1)
    expect(page).to have_selector('.comment-identifier')
  end

  scenario 'Show the number of comments for a post' do
    visit user_posts_path(1)
    expect(page).to have_content('Comments: 6')
  end

  scenario 'Show number of likes for a post' do
    visit user_posts_path(1)
    expect(page).to have_content('Likes: 3')
  end

  scenario 'Show pagination if there are more posts that fit on the view' do
    visit user_posts_path(1)
    expect(page).to have_content('Pagination') if page.all('.post-identifier').count > 3
  end

  scenario "When a post is clicked, it redirects the user to that post's show page" do
    visit user_posts_path(1)
    click_link(href: '/users/1/posts/1')
    expect(page).to have_current_path('/users/1/posts/1')
  end
end
