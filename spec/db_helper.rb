require 'pg'

module DBHelper
  def self.truncate
    conn = PG.connect(dbname: 'bookmark_manager_test')
    conn.exec('TRUNCATE bookmarks')
  end

end