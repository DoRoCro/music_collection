require_relative('../sql_runner.rb')
require_relative('./albums.rb')

class Artist

  attr_reader :artist_id, :name

  def initialize(options)
    @name = options["name"]
    @artist_id = options["artist_id"] if options["artist_id"]
  end

  def save()
    # guard against artist already present
    sql = "SELECT * FROM artists WHERE name = '#{@name}'"
    check = SqlRunner.run(sql)
    if check.values.length > 0 # record already exists, so get id from returned array of hash
      @artist_id = check[0]['artist_id']
    else
      sql = "INSERT INTO artists 
      (name)
      VALUES
      ('#{@name}') RETURNING artist_id;"
      results = SqlRunner.run(sql)
      @artist_id = results.first['artist_id'].to_i
    end

  end

  def self.all()

    sql = "SELECT * FROM artists;"
    results = SqlRunner.run(sql)
    result_objects = results.map {|result| Artist.new(result)}
    return result_objects
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@artist_id};"
    results = SqlRunner.run(sql)
    result_objects = results.map {|result| Album.new(result)}
    return result_objects
  end

  def edit(changes)
    @name = changes['name'] if changes['name']
    sql = "UPDATE artists SET name = '#{@name}' WHERE artist_id = #{@artist_id}"
    results = SqlRunner.run(sql)
    return results
  end

  def delete()
    sql = "DELETE FROM artists WHERE artist_id = '#{artist_id}"
    results = SqlRunner.run(sql)
    return results
  end

  def self.find_by_artist_id(id)
    sql = "SELECT * FROM artists WHERE artist_id = #{id}"
    results = SqlRunner.run(sql)
    return Artist.new(results.first)
  end

end