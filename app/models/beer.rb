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
        system "clear"
        ub.each do |beer| 
            current_beer = Beer.find(beer[0]).name
            puts "#{current_beer}: #{beer[1]}"
        end
        self.prompt.keypress "\nPress any key to return to previous menu."
        Menu.beer_stats_menu
    end

    def self.get_least_drank 
        ub = UserBeer.where(:has_tried => true).group(:beer_id).count(:id)
        beer = ub.sort { |a, b| b <=> a }[0][0]
        system "clear"
        puts "Maybe it's new or maybe it's terrible.\n\nEither way, maybe you should give it a try?\n\n"
        prompt.keypress "Name: #{Beer.find(beer).name}\n\n"
        Menu.beer_stats_menu
    end

    def self.abv
        # returns array of beer names and abv sorted in descending order
        beers = self.order(abv: :desc).take(10)
        beers.each do |beer| 
            puts "#{beer.name}: #{beer.abv}"
        end
        self.prompt.keypress "\nPress any key to return to previous menu."
        Menu.beer_stats_menu
    end
end