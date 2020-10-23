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
        ub = UserBeer.where(:has_tried => true)
        beer_count = {}
        ub.each do |ub_instance|
            if !beer_count[ub_instance.beer_id]
                beer_count[ub_instance.beer_id] = 1
            else
                beer_count[ub_instance.beer_id] += 1
            end
        end
        max = beer_count.sort { |a, b| b[1] <=> a[1] }
        beer = Beer.find(max[0][0]).name
        system "clear"
        Ascii.bubble_pint
        self.prompt.keypress "\nName: #{beer}"
        Menu.beer_stats_menu
    end

    def self.top_ten
        ub = UserBeer.where(:has_tried => true)
        beer_count = {}
        ub.each do |ub_instance|
            if !beer_count[ub_instance.beer_id]
                beer_count[ub_instance.beer_id] = 1
            else
                beer_count[ub_instance.beer_id] += 1
            end
        end
        max = beer_count.sort { |a, b| b[1] <=> a[1] }
        count = 0
        while count < 10 do 
            current_beer = Beer.find(max[count][0]).name
            puts "#{current_beer}"
            count += 1
        end
        self.prompt.keypress "\nPress any key to return to previous menu."
        Menu.beer_stats_menu
    end

    def self.get_least_drank 
        ub = UserBeer.where(:has_tried => true).group(:beer_id).count(:id)
        beer = ub.sort { |a, b| a[1] <=> a[1] }[0][0]
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

    def self.faqs
        
        puts "The Four main ingredients of beer are grain, hops, yeast and water"
        puts "*** as you can tell, water quality is very important 90 to 95% of the total ***\n\n"
        puts "
        Ales and Lagers are categories, not styles.
        The difference between Ales and Lagers come straight down to the yeast used
        under fermentation. Ale yeasts, which ferment at warmer temperatures, 
        are know for the brighter, fruitier, and spicier flavors they produce, 
        while cool-fermented Lager yeasts create much more subtle, smooth-finished flavors.
        Color(SRM), body, and ABV have absolutely nothing to do with the classifications.\n\n"
        puts "ABV = stands for alcohol by volume\n"
        puts "IBU = stands for International bitternes unit, which are classified from 0 to 100"
        puts "i.e. Bud/Miller/Coors,etc have 10ish and 'Dogfish Head 90 Minute IPA' has 90 IBUs \n"
        puts "SRM = Standard Reference Method, is a method for color assessment of wort. From 1 to 40\nlet say that a Pilsener are aroud 5 SRM and a Stout is 40 SRM." 

        
    end
end