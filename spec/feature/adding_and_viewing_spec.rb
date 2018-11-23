feature 'adding and viewing comments' do
  scenario 'a comment is added to a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')

    visit '/'
    click_button 'View Bookmarks'

    first('.bookmark').click_button 'Add Comment'

    visit "/bookmarks/#{bookmark.id}/comments/new"
    fill_in 'comment', with: 'this is a new comment'
    click_button 'Add New Comment'

    expect(current_path).to eq '/bookmarks/index'

    expect(first('.bookmark')).to have_content 'this is a new comment'
  end
end
