require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  scenario 'show user picture' do
    visit user_path(1)
    expect(page).to have_selector('img[src="https://unsplash.com/photos/F_-0BxGuVvo"]')
  end

  scenario 'show username' do
    visit user_path(1)
    expect(page).to have_content('Tom')
  end

  scenario 'show number of posts' do
    visit user_path(1)
    expect(page).to have_content('Number of posts: 4')
  end

  scenario 'show user bio' do
    visit user_path(1)
    expect(page).to have_content('Teacher from Mexico.')
  end

  scenario 'show last 3 user posts' do
    visit user_path(1)
    expect(page).to have_selector('.post-identifier', count: 3)
  end

  scenario 'show view all posts button' do
    visit user_path(1)
    expect(page).to have_selector('a', text: 'See all posts')
  end

  scenario 'clicks on users post redirect to post show page' do
    visit user_path(1)
    click_link(href: '/users/1/posts/2')
    expect(page).to have_current_path('/users/1/posts/2')
  end

  scenario 'clicks on sell all posts redirect to posts index page' do
    visit user_path(1)
    click_link(href: '/users/1/posts')
    expect(page).to have_current_path('/users/1/posts')
  end
end
