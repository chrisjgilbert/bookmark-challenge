require 'bookmark'

describe Bookmark do

  describe '#self_all' do
    it 'returns an array of book marks' do
      expect(Bookmark.all).to be_a(Array)
    end
  end
end
