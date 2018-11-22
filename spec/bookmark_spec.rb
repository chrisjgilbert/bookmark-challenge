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
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

end
