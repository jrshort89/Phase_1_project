class User < ActiveRecord::Base
    has_many :user_beers
    has_many :beers, through: :user_beers

    def get_beers
        # gets user's beer entire list that has_tried
        ub = UserBeer.where "user_id = ?", self.id
    end

    def get_untasted
        # gets user's list of untried beers has_tried = false
        ub = UserBeer.where(:user_id => self.id, :has_tried => false)
        #
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
        Beer.where(:id => bids) #we call all the numbers
    end

    def get_most_drank
        # get user's most drank beer
        # compare quantity of 'has_tried = true' per UserBeer for this user
        ub = self.get_beers.where(:has_tried => true).limit(1).count(:beer_id)
        # ub is the beer_id of the most drank beer
        Beer.where(:id => ub)
       
        
    end

    def try_an_untasted_beer
        # returns a random untasted beer to try - mmm hope you like the sample
        # user instance method
        
        rand_num = rand(1..(Beer.count)) #how I get off rid of 0
        Beer.find(rand_num)
       
    end

end