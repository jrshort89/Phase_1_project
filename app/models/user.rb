class User < ActiveRecord::Base
    @@prompt = TTY::Prompt.new
    has_many :user_beers
    has_many :beers, through: :user_beers

    def self.prompt
        @@prompt
    end

    # def display_helper
    #     each do |x|
    #         puts "Name: #{x.name}, Description: #{x.description}, Abv: #{x.abv}%"
    #         puts "Category: #{x.cat_name}, Country: #{x.country}\n\n"
    #     end

    # end
    
    def get_beers
        # gets user's beer entire list that has_tried
        ub = UserBeer.where "user_id = ?", self.id
        bids = ub.map do |ub|
            ub.beer_id
        end
        yb = Beer.where(:id => bids)
        yb.each do |x|
            puts "Name: #{x.name}, Category: #{x.cat_name}"
           
        end
        User.prompt.keypress("This is your personal beer list!!!\n\n")
        UserMenu.main_user_menu(UserMenu.current_user)
    end

    def get_untasted
        # gets user's list of untried beers has_tried = false

        match_ub = UserBeer.where(:user_id => self.id, :has_tried => false)
        if match_ub.count == 0
            UserMenu.main_user_menu(UserMenu.current_user)
        end
        ub = match_ub.map do |beer|
            beer.beer_id
        end# ub has the arrays of ids
        yb = Beer.where(:id => ub) #with this we have an array of objects by beer_id
        beer = yb.map {|beer| "Id: #{beer.id} | NAME: #{beer.name} | CATEGORY: #{beer.cat_name} " } 
        response = User.prompt.multi_select("Place your order", beer)
        b_ids = response.map do |selected_beer|
            selected_beer.split[1].to_i
        end #we need to get our user beer objects, the ones that match our selected b_ids
        matched_ub = match_ub.select do |ub|
          b_ids.include?(ub.beer_id)
        end.each { |match| match.has_tried = true; match.save }
        UserMenu.main_user_menu(UserMenu.current_user)
    end
    
    def get_tasted
        # gets user's list of tasted beers
        # get beer_ids from the array of objects
        # where will you find beer names etc? Beer
        # how will you compare those beers to the beers you need
        # how will you return only the beer objects you want
        ub = UserBeer.where(:user_id => self.id, :has_tried => true)
        bids = ub.map do |ub|
            ub.beer_id
        end
        #bids it's an array of all the beer_ids number 
        yb = Beer.where(:id => bids) #we call all the numbers
        yb.each do |x|
            puts "Name: #{x.name}, Category: #{x.cat_name}"
          
            end



    end

    def get_most_drank
        # get user's most drank beer
        # compare quantity of 'has_tried = true' per UserBeer for this user
        ub = UserBeer.where(:user_id => self.id, :has_tried => true).group(:beer_id).count(:id)
        # ub is the beer_id of the most drank beer
        yb = Beer.where(:id => ub.keys[0])
        yb.each do |x|
            puts "Name: #{x.name}, Category: #{x.cat_name}"      
        end        
    end

    def try_an_untasted_beer
        # returns a random untasted beer to try - mmm hope you like the sample
        # user instance method
        
        rand_num = rand(1..(Beer.count)) #how I get off rid of 0
        yb = Beer.find(rand_num)
        yb.each do |x|
            puts "Name: #{x.name}, Category: #{x.cat_name}"

        end

       
    end

end