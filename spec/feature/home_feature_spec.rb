feature 'welcome' do
  scenario 'visting home page' do
    visit '/'
    expect(page).to have_content 'Hello'
  end
end
