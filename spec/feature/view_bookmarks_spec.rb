require_relative '../../app/app.rb'

feature 'should show a list of bookmarks' do
  let(:database) { PG.connect(dbname: ENV['DATABASE']) }
  scenario 'expect to display bookmarks' do
    database.exec("INSERT INTO bookmarks(url) VALUES ('http://www.google.com')")
    database.exec("INSERT INTO bookmarks(url) VALUES ('http://www.youtube.com')")
    visit('/bookmarks')
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.youtube.com")
  end  
end
