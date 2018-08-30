class Genre < ActiveRecord::Base
has_many :song_genres
has_many :songs, through: :song_genres
has_many :artists, through: :songs  #song_genres?

    def slug
      temp = self.name
      temp = temp.downcase
      temp.gsub(/[^abcdefghijklmnopqrstuvwxyz]/,'-')

    end

    def self.find_by_slug(slugg)
      artist = ""
      self.all.each do |eachA|
        if eachA.slug == slugg
          artist = eachA
        end
      end
      artist
    end

end
