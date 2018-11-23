feature 'updating a bookmark' do
  scenario 'updates a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/'
    click_button 'View Bookmarks'
    expect(page).to have_link 'Makers Academy', href: 'http://www.makersacademy.com'
    first('.bookmark').click_button 'Update'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"
    fill_in :title, with: 'Edited Title'
    fill_in :url, with: 'Edited URL'
    click_button 'Submit'
    expect(current_path).to eq '/bookmarks/index'
    expect(page).to have_link 'Edited Title', href: 'Edited URL'
    expect(page).not_to have_link 'Makers Academy', href: 'http://www.makersacademy.com'
  end
end
