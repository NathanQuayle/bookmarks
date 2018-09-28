require 'sinatra/base'
require 'sinatra/flash'
require_relative '../lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, "My session secret"

  register Sinatra::Flash
  ENV['DATABASE'] ||= 'bookmark_manager'

  get '/' do
    redirect('/bookmarks')
  end

  get '/bookmarks' do
    erb(:bookmarks)
  end

  post '/bookmarks' do
    flash[:notice] = Bookmarks.create(@params[:add_url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
