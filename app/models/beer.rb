class Beer < ActiveRecord::Base
    has_many :user_beers
    has_many :users, through: :user_beers

    def self.get_most_drank
        # gets the beer drank by most users
        # only has_tried = true counts
    end

    def self.get_least_drank 
        
    end

    def self.alphabatize
        # return alphabatized array of beer names
    end

    def self.abv
        # returns array of beer names and abv sorted in descending order
    end
end