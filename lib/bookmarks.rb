require 'pg'

class Bookmarks

  def self.all
    
    conn = PG.connect( dbname: 'bookmark_manager' )
    result = conn.exec( "SELECT url FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
    
  end

end
