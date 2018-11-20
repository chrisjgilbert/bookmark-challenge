require 'pg'

feature 'adding bookmarks' do
  scenario 'add a new bookmark' do
    visit '/bookmarks'
    click_button 'Add Bookmarks'
    fill_in :url, with: "http://www.hello.com"
    click_button 'Add New Bookmark'
    expect(page).to have_content "http://www.hello.com"
  end
end
