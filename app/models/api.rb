class Api

    @@prompt = TTY::Prompt.new

    def self.prompt
        @@prompt
    end

    def self.get_beer_list
        response_string = RestClient.get("https://data.opendatasoft.com/api/records/1.0/search/?dataset=open-beer-database%40public-us&rows=200&facet=style_name&facet=cat_name&facet=name_breweries&facet=country&refine.country=United+States")
        response_hash = JSON.parse(response_string)
        beers = response_hash["records"].map do |beer|
            beer["fields"]
        end
    end

    def self.sample_printer
        beer = self.get_beer_list.sample
        puts "#{beer["name"]} | #{beer["cat_name"] ? beer["cat_name"] : "The maker of this beer didn't think it was special enough for a description."}"
        response = self.prompt.yes? "\nWould you like a list of beers with more beers like this beer?"
    end

    def self.beer_sample_handler
        # make this handle response and return the list the user requests
        answer = self.sample_printer
        system "clear"
        if answer
            self.beer_search_result_selector 
        else
            if self.prompt.yes? "Would you like anothor sample? \n\nEnter 'n' to return to the previous menu\n\n"
                system "clear"
                self.beer_sample_handler
            else
                UserMenu.main_user_menu(UserMenu.current_user)
            end
        end
    end

    def self.beer_list_populator
        beers = self.get_beer_list.map do |beer|
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

    def self.beer_search_result_selector
        beer = self.beer_list_populator.map { |beer| "#{beer.id} | #{beer["name"]} | #{beer["cat_name"]}" }
        response = self.prompt.multi_select("Please pick a few beers you would like to try:", beer).map do |selected_beer|
            selected_beer.split(" | ")[0].to_i
        end
        # create the UserBeer objects from this
    end
end