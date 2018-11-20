require 'sinatra/base'
require_relative './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  # Set up the Bookmark model to use the bookmark_manager database when we are in the development environment, and the bookmark_manager_test database when we are in the test database.

  get '/bookmarks' do
    erb :'bookmarks'
  end

  get '/bookmarks/index' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  run! if app_file == $0

end
