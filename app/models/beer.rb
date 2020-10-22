class Beer < ActiveRecord::Base
    @@prompt = TTY::Prompt.new

    has_many :user_beers
    has_many :users, through: :user_beers

    def self.prompt
        @@prompt
    end

    def self.get_most_drank
        # gets the beer drank by most users
        # only has_tried = true counts
        # ub = UserBeer.select(:beer_id).where(:has_tried => true)
        ub = UserBeer.where(:has_tried => true).group(:beer_id).count(:id)
        max = ub.sort { |a, b| a <=> b }
        beer = Beer.find(max[0][0]).name
        system "clear"
        Ascii.bubble_pint
        self.prompt.keypress "\nName: #{beer}"
        Menu.beer_stats_menu
    end

    def self.top_ten
        ub = UserBeer.where(:has_tried => true).group(:beer_id).count(:id).take(10)
        ub.each do |beer| 
            puts Beer.find(beer[0]).name + ": #{beer[1]}"
        end
    end

    def self.get_least_drank 
        ub = UserBeer.where(:has_tried => true).group(:beer_id).count(:id)
        min = ub.sort { |a, b| b <=> a }
        puts "Name: #{Beer.find(min[0][0]).name}"
    end

    def self.alphabatize
        # return alphabatized array of beer names
        self.order :name
    end

    def self.abv
        # returns array of beer names and abv sorted in descending order
        self.order abv: :desc
    end
end