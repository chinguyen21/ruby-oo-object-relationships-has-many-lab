
class Artist 
  attr_accessor :name

  @@all_artists = []
  def initialize(name)
    @name = name
    self.class.all_artists << self
  end
  
  def self.all_artists
    @@all_artists
  end

  def add_song(song)
    song.artist = self
    
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def add_song_by_name(song_name)
    new_song = Song.new(song_name)
    self.add_song(new_song)
  end

  def self.song_count
    total = 0
    self.all_artists.each do |artist|
      total += artist.songs.length
    end
    total
  end

end



