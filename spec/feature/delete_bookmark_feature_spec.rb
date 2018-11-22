feature 'deleting a bookmark' do
  scenario 'deletes a bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')

    visit('/')
    click_button 'View Bookmarks'

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Facebook', href: 'http://www.facebook.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks/index'

    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Facebook', href: 'http://www.facebook.com')
  end
end
