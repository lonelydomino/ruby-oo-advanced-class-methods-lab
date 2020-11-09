class Song
  attr_accessor :name, :artist_name
  @@all = []



  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  def self.create
    song = self.new
    song.save
    song
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      puts "not found, creating #{name}"
      self.create_by_name(name)
    else
      return self.find_by_name(name)
    end
  end
  def self.alphabetical
    self.all.sort_by!{|item| item.name.downcase}
  end
  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    song_name = data[1] 
    song_name.delete_suffix!('.mp3')
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end
  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    song_name = data[1] 
    song_name.delete_suffix!('.mp3')
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song.save
    song
  end
  def self.destroy_all
    self.all.clear
  end
end