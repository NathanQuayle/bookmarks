require 'bookmarks'
describe Bookmarks do
  describe ".all" do
    it 'Should return all bookmarks' do
      expect(Bookmarks.all).to include("http://www.makersacademy.com")
      expect(Bookmarks.all).to include("http://www.destroyallsoftware.com")
    end 
  end
end
