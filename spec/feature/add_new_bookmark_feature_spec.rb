require 'pg'

feature 'adding bookmarks' do
  scenario 'add a new bookmark' do
    visit '/bookmarks/new'
    fill_in :url, with: "http://www.hello.com"
    click_button 'Add Bookmark'

    expect(page).to have_content "http://www.hello.com"
  end
end
