require 'sinatra/base'
require 'sinatra/flash'
require_relative '../lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, "My session secret"

  register Sinatra::Flash
  ENV['DATABASE'] ||= 'bookmark_manager'

  get '/' do
    'Hello world!'
  end

  get '/bookmarks' do
    erb(:bookmarks)
  end

  post '/bookmarks' do
    if Bookmarks.real?(@params[:add_url])  
      Bookmarks.create(@params[:add_url])
    else
      flash[:notice] = "Please enter a valid website!"
    end
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
