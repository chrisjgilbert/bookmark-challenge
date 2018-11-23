require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative './lib/bookmark.rb'
require_relative './lib/database_connection_setup.rb'
require_relative './lib/comment'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

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
    flash[:notice] = "Invalid URL!" unless Bookmark.create(title: params[:title], url: params[:url])
    redirect :'/bookmarks/index'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect 'bookmarks/index'
  end

  get '/bookmarks/:id/update' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/update'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks/index'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark = Bookmark.find(id: params[:id])
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks/index'
  end

  run! if app_file == $0

end
