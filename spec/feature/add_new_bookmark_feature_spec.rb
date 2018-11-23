require 'pg'

feature 'adding bookmarks' do
  scenario 'add a new valid bookmark' do
    visit '/'
    click_button 'Add Bookmarks'
    fill_in :title, with: 'Test Bookmark'
    fill_in :url, with: 'http://www.testbookmark.com'
    click_button 'Add New Bookmark'
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end

  scenario 'add a non valid new bookmark' do
    visit '/'
    click_button 'Add Bookmarks'
    fill_in :title, with: 'Test Bookmark'
    fill_in :url, with: 'this is not a valid url'
    click_button 'Add New Bookmark'
    expect(page).to have_content('Invalid URL!')
    expect(page).not_to have_content 'this is not a valid url'
    expect(page).not_to have_content 'Test Bookmark'
  end
end
