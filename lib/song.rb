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
    self.all.detect{ |song| song.name == name }
    #@@all.detect{ |song| song.name == name } also works
  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name)
    #     self.find_by_name(name)
    # else 
    #     self.create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name) 
    # || means "or" so we are saying find name or create name
    end

  def self.alphabetical
    #@all.sort{ |a,b| a.name <=> b.name}
    # @all.each.name.sort{ |a,b| a.name <=> b.name}
    # this compares the current name to the next name
    #@@all.sort_by{ |song| song.name }
    self.all.sort_by{ |song| song.name }
  end
  
  def self.new_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
    #@@all = []
    #@@all.clear
  end

end
