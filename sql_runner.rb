require('PG')

class SqlRunner

  def self.run(sql)
    begin
      db = PG.connect({dbname: "music_collection", host: "localhost"})
      results = db.exec(sql)
    rescue
      #
    ensure
      db.close()
    end
    return results
  end

end