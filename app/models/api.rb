class Api

    @@prompt = TTY::Prompt.new

    def self.prompt
        @@prompt
    end

    def self.get_beer_list(beer_style=BeerList.beer.sample)
        response_string = RestClient.get("https://data.opendatasoft.com/api/records/1.0/search/?dataset=open-beer-database%40public-us&rows=20&facet=style_name&facet=cat_name&facet=name_breweries&facet=country&refine.country=United+States&refine.style_name=#{beer_style}")
            response_hash = JSON.parse(response_string)
            beers = response_hash["records"].map do |beer|
                beer["fields"]
        end
    end

    def self.beer_style_menu
        response = self.prompt.select("Please select a style:\n\n", BeerList.beer)
        response = response.split(" ").join("+")
        self.get_beer_list(response)
        self.beer_search_result_selector(response)
    end

    def self.sample_printer
        beer = self.get_beer_list.sample
        puts "#{beer["name"]} | #{beer["cat_name"] ? beer["cat_name"] : "The maker of this beer didn't think it was special enough for a description."}"
        response = self.prompt.yes? "\nWould you like a list of beers with more beers like this beer?"
    end

    def self.beer_sample_handler
        # make this handle response and return the list the user requests
        system "clear"
        answer = self.sample_printer
        if answer
            self.beer_search_result_selector(BeerList.beer.sample.split(" ").join("+")) 
        else
            if self.prompt.yes? "Would you like another sample? \n\nEnter 'n' to return to the previous menu\n\n"
                self.beer_sample_handler
            else
                UserMenu.main_user_menu(UserMenu.current_user)
            end
        end
    end

    def self.beer_list_populator(link)
        beers = self.get_beer_list(link).map do |beer|
            Beer.find_or_create_by(
                name: beer["name"],
                description: beer["descript"],
                cat_name: beer["cat_name"],
                country: beer["country"],
                abv: beer["abv"]
            )
        end
        beers
    end 

    def self.beer_search_result_selector(link)
        beer = self.beer_list_populator(link).map { |beer| "#{beer.id} | #{beer["name"]} | #{beer["cat_name"]}" }
        system "clear"
        response = self.prompt.multi_select("Please pick a few beers you would like to try:", beer).map do |selected_beer|
            selected_beer.split(" | ")[0].to_i
        end.each do |b_id|
        UserBeer.create user_id: UserMenu.current_user.id, beer_id: b_id, has_tried: false 
        end
        # eventually this should take the user to their beer list
        # UserMenu.main_user_menu(UserMenu.current_user)
        UserMenu.current_user.get_beers
        UserMenu.main_user_menu(UserMenu.current_user)
    end
end