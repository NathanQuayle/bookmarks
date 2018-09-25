require 'sinatra/base'
require_relative '../lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello world!'
  end

  get '/bookmarks' do
    erb(:bookmarks)
  end

  run! if app_file == $0
end
