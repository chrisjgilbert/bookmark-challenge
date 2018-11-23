require 'bookmark'
require 'database_helpers'

describe Bookmark do

  describe '.all' do
    it 'returns a list of bookmarks' do
      PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(title: 'Google', url: 'http://www.google.com')

      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id}")

      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq persisted_data.first['title']
      expect(bookmark.url).to eq persisted_data.first['url']
    end
  end

  describe '.create' do
    it 'creates a new bookmark if url is valid' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end

    it 'does not create a url with an invalid url' do
      bookmark = Bookmark.create(url: 'blah blah blah', title: 'Bad Bookmark')
      expect(bookmark).not_to be_a Bookmark
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')
      expect(Bookmark.all.first.id).to eq bookmark.id
      expect(Bookmark.all.first.title).to eq bookmark.title
      expect(Bookmark.all.first.url).to eq bookmark.url
      Bookmark.update(id: bookmark.id, title: "New Title", url: "www.newurl.com")
      expect(Bookmark.all.first.id).to eq bookmark.id
      expect(Bookmark.all.first.title).to eq 'New Title'
      expect(Bookmark.all.first.url).to eq 'www.newurl.com'
    end
  end

  describe '.find' do
    it 'returns a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')
      returned_bookmark = Bookmark.find(id: bookmark.id)
      expect(returned_bookmark.title).to eq bookmark.title
      expect(returned_bookmark.url).to eq bookmark.url
      expect(returned_bookmark.id).to eq bookmark.id
    end
  end

end
