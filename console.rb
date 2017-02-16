require('pry')
require_relative('./models/artists.rb')
require_relative('./models/albums.rb')

artist1 = Artist.new({"name" => "test_Bryan Adams"})
artist1.save()
artist2 = Artist.new({"name" => "test_David Bowie"})
artist2.save()

album1 = Album.new({"title" => "test_Greatest Hits", "genre" => "Classic Rock", "artist_id" => artist1.artist_id })
album1.save()
album2 = Album.new({"title" => "test_Hunky Dory", "genre" => "Glam Rock", "artist_id" => artist2.artist_id })
album2.save()

# binding.pry
# nil
artist1.edit( {'name' => 'test_BBryan Addams'})
album1.edit({'title' => 'test_More Greatest Hits', 
             'genre' => "Weird"})

puts album2.artist.artist_id + " " + album2.artist.name

artist2.albums.each {|x| puts x.album_id.to_s + " " + x.title }

artist2.delete
album2.delete
# binding.pry
puts Album.find_by_album_id(1).title + " = Album 1 (if exists)"
puts Artist.find_by_artist_id(1).name + "= Artist 1 (if exists)"
puts Album.find_by_album_id(2).title + " = Album 2 (if exists)"
puts Artist.find_by_artist_id(2).name + "= Artist 2 (if exists)"
puts Album.find_by_album_id(3).title + " = Album 3 (if exists)"
puts Artist.find_by_artist_id(3).name + "= Artist 3 (if exists)"