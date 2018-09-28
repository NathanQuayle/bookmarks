require 'pg'

class Bookmarks
  def self.all
    conn = PG.connect(dbname: ENV['DATABASE'])
    result = conn.exec("SELECT url FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end
   
  def self.create(url)
    if(real?(url))
      conn = PG.connect(dbname: ENV['DATABASE'])
      conn.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
      "#{url} added successfully!"
    else
      "Please enter a valid website!"
    end
  end

  def self.real?(url)
    /(http:\/\/|https:\/\/)?(www.)(\w+\d?)(.com|.co.uk|.org|.gov)/ === url
  end
end
