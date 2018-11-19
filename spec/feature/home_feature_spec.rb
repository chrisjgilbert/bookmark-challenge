feature 'welcome' do
  scenario 'visting home page' do
    visit '/bookmarks'
    expect(page).to have_content 'Hello'
  end
end
