require 'pry'

class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end


    def self.all
        @@all
    end


    def songs
        # returns all songs associated with this Artist
        Song.all.select do |song|
        song.artist == self
        # binding.pry
        end
    end


    def new_song(name, genre)
        # given a name and genre, creates a new song associated with that artist
        song = Song.new(name, self, genre)
        # binding.pry
    end


    def genres
        # has many genres, through songs
        songs.map do |song|
            song.genre
            # binding.pry
        end
    end


end
