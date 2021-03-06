require('PG')
require('logger')

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
    log = Logger.new('sql.log')
    log.info(sql)
    return results
  end

end