require_relative('../sql_runner.rb')

class Album

  attr_reader :artist_id, :album_id, :title

  def initialize(options)
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"] if options["artist_id"]
  end

  def save()

    sql = "INSERT INTO albums 
    (title, genre, artist_id)
    VALUES
    ('#{@title}', '#{@genre}', #{@artist_id}) RETURNING album_id;"

    results = SqlRunner.run(sql)
    @album_id = results.first['album_id'].to_i

  end

  def self.all()

    sql = "SELECT * FROM albums;"
    results = SqlRunner.run(sql)
    result_objects = results.map {|result| Album.new(result)}
    return result_objects
  end

  def artist
    # returns artist object for album
    sql = "SELECT * FROM artists WHERE artist_id = #{@artist_id};"
    results = SqlRunner.run(sql)
    return Artist.new(results.first)
  end

  def edit(changes)
    @title = changes['title'] if changes['title']
    @genre = changes['genre'] if changes['genre']
    @artist_id = changes['artist_id'] if changes['artist_id']
    sql = "UPDATE albums SET title = '#{@title}', genre = '#{@genre}', artist_id = #{artist_id} WHERE album_id = #{@album_id} RETURNING *;"
    results = SqlRunner.run(sql)
    return results
  end

  def delete()
    sql = "DELETE FROM albums WHERE album_id = '#{album_id}"
    results = SqlRunner.run(sql)
    return results
  end

  def self.find_by_album_id(id)
    sql = "SELECT * FROM albums WHERE album_id = #{id}"
    results = SqlRunner.run(sql)
    return Album.new(results.first)

  end

end