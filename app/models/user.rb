class User < ActiveRecord::Base
    has_many :user_beers
    has_many :beers, through: :user_beers

    def get_beers
        # gets user's beer list by name and has_tried
        UserBeer.where "user_id = ?" self.id
    end

    def get_untasted
        # gets user's list of untried beers

    end

    def get_tasted
        # gets user's list of tasted beers
    end

    def get_most_drank
        # get user's most drank beer
    end

    def try_an_untasted_beer
        # returns a random untasted beer to try - mmm hope you like the sample
        # user instance method
    end

end