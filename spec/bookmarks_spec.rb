require 'bookmarks'
describe Bookmarks do
  let(:database) { PG.connect(dbname: ENV['DATABASE']) }
  describe ".all" do
    it 'Should return all bookmarks' do
      database.exec("INSERT INTO bookmarks(url) VALUES ('http://www.google.com')")
      expect(Bookmarks.all).to eq(["http://www.google.com"])
    end 
  end

  describe ".real?" do
    it 'validates a real website' do
      expect(Bookmarks.real?('www.google.com')).to eq(true)
    end

    it 'flags a invalid website' do
      expect(Bookmarks.real?('www.google.om')).to eq(false)
    end
  end
end