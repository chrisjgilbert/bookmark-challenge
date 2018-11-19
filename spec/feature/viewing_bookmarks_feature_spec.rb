feature 'viewing bookmarks' do
  scenario 'visiting the index page' do
    visit '/bookmarks'
    click_button 'View Bookmarks'
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
  end
end
