feature 'adding and viewing comments' do
  scenario 'a comment is added to a bookmark' do
    Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')

    visit '/'
    click_button 'View Bookmarks'

    first('.bookmark').click_button 'Add Comment'

    fill_in 'comment', with: 'this is a new comment'
    click_button 'submit'

    expect(current_path).to eq '/bookmarks/index'

    expect(first('.bookmark')).to have_content 'this is a new comment'
  end
end
