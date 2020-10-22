class User < ActiveRecord::Base
    has_many :user_beers
    has_many :beers, through: :user_beers

    # def visualizer_helper
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
            puts "Name: #{x.name}, Description: #{x.description}, Abv: #{x.abv}%"
            puts "Category: #{x.cat_name}, Country: #{x.country}\n\n"
        end
    end

    def get_untasted
        # gets user's list of untried beers has_tried = false
        ub = UserBeer.where(:user_id => self.id, :has_tried => false)
        bids = ub.map do |ub|
            ub.beer_id
        end
        yb = Beer.where(:id => bids)
        yb.each do |x|
            puts "Name: #{x.name}, Description: #{x.description}, Abv: #{x.abv}%"
            puts "Category: #{x.cat_name}, Country: #{x.country}\n\n"
        end
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
            puts "Name: #{x.name}, Description: #{x.description}, Abv: #{x.abv}%"
            puts "Category: #{x.cat_name}, Country: #{x.country}\n\n"
        end
    end

    def get_most_drank
        # get user's most drank beer
        # compare quantity of 'has_tried = true' per UserBeer for this user
        ub = UserBeer.where(:user_id => self.id, :has_tried => true).limit(1).count(:beer_id)
        # ub is the beer_id of the most drank beer
        yb = Beer.where(:id => ub)
        yb.each do |x|
            puts "Name: #{x.name}, Description: #{x.description}, Abv: #{x.abv}%"
            puts "Category: #{x.cat_name}, Country: #{x.country}\n\n"
        end
        
    end

    def try_an_untasted_beer
        # returns a random untasted beer to try - mmm hope you like the sample
        # user instance method
        
        rand_num = rand(1..(Beer.count)) #how I get off rid of 0
        yb = Beer.find(rand_num)
        yb.each do |x|
            puts "Name: #{x.name}, Description: #{x.description}, Abv: #{x.abv}%"
            puts "Category: #{x.cat_name}, Country: #{x.country}\n\n"
        end

       
    end

end