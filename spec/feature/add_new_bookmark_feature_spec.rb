require 'pg'

feature 'adding bookmarks' do
  scenario 'add a new bookmark' do
    visit '/'
    click_button 'Add Bookmarks'
    fill_in :title, with: 'Test Bookmark'
    fill_in :url, with: 'http://www.testbookmark.com'
    click_button 'Add New Bookmark'
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end
end
