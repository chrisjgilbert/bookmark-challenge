require 'sinatra/base'
require_relative './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb :'bookmarks'
  end

  get '/bookmarks/index' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/create' do
    Bookmark.create(title: params[:title], url: params[:url])
    redirect :'/bookmarks/index'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect 'bookmarks/index'
  end

  run! if app_file == $0

end
