require 'pg'

feature 'viewing bookmarks' do
  scenario 'visiting the index page' do
    Bookmark.create(title: 'Google', url: 'http://www.google.com')
    Bookmark.create(title: 'Makers', url: 'http://www.makersacademy.com')

    visit '/'
    click_button 'View Bookmarks'

    expect(page).to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
  end
end
