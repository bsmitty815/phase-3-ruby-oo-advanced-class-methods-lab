

require "pry"
#gem install pry

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create # creates a new song and saves it to a variable
    song = Song.new
    song.save # sends the song to the save method so that it can push it into the @@all array
    song # returns the song
  end

  def self.new_by_name(song_name)
    song = self.new # creates a new song
    song.name = song_name # takes the song_name that passes through and saves the song to the instance name/@name
    song # reutrns the song
  end

  def self.create_by_name(song_name)
    song = self.create #creates a new song and calls on create method 
    song.name = song_name # takes the song_name that passes through and saves the song to the instance name/@name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect { |song| # detect method will return the first name that matches the argument
      song.name == song_name
    }
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
    # here we are calling the find_by_name method and if it comes back false we run the next method create_by_name
  end

  def self.alphabetical
    self.all.sort_by { |song| #sort @@all by song name in alphabetical order
    song.name
  }
  end

  def self.new_from_filename(filename)
    new_file = filename.split(" - ") #this will split the filename into two strings and get rid of this "-"
    artist_name = new_file[0] # this will set the artist name from the first index of new_file
    song_name = new_file[1].gsub(".mp3","") # this will set the artist name from the second index of new_file. the gsub method will replace the fist thing with the second thing. in this case the .mp3 with an empty string
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    new_file = filename.split(" - ")
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3","")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear # clears the @@all variable
  end
end
