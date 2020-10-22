class UserMenu
    @@prompt = TTY::Prompt.new
    @@current_user = nil
    @@menu_choices = {
        find: "Find a delicious beer to drink",
        search: "Search for beers from all over",
        beer_list: "View your beer list",
        tasted_beer: "View all of your tasted beers",
        untasted_beer: "View all of your untasted beers",
        drink_the_most: "View the beer you drink the most"
    }

    def self.prompt
        @@prompt
    end

    def self.current_user
        @@current_user
    end

    def self.current_user=(current_user)
        @@current_user = current_user
    end

    def self.menu_choices
        @@menu_choices
    end

    def self.main_user_menu(user)
        self.current_user = user
        system "clear"
        user_response = prompt.select("#{user.name}, choose your beer adventure:\n") do |menu|
            menu.choice self.menu_choices[:find]
            menu.choice self.menu_choices[:search]
            menu.choice self.menu_choices[:beer_list]
            menu.choice self.menu_choices[:tasted_beer]
            menu.choice self.menu_choices[:untasted_beer]
            menu.choice self.menu_choices[:drink_the_most]
            menu.choice "Exit"
          end
        self.main_menu_helper(user_response)
    end

    def self.main_menu_helper(user_response)
        system "clear"
        case user_response
        when self.menu_choices[:beer_list]
            Menu.pint_pic
            self.current_user.get_beers
            prompt.keypress("This is your beer list!!!\n\nWhat are you waiting to try them all?\n\n")
            UserMenu.main_user_menu(UserMenu.current_user)

            #this should be get_beer method
            # self.current_user.get_beers
        when self.menu_choices[:find]
            Api.beer_sample_handler
        when self.menu_choices[:search]
            #this should lead to a search list
            Api.beer_search_result_selector
            prompt.keypress "This should be a list of search terms to search by"
        when self.menu_choices[:tasted_beer]
            Menu.pint_pic
            prompt.keypress("So far you have tried these beers\n\n")
            self.current_user.get_tasted
            prompt.keypress("Seriously just that!!\n\n")
            UserMenu.main_user_menu(UserMenu.current_user)
        when self.menu_choices[:untasted_beer]
            Menu.pint_pic
            # prompt.keypress("View all untasted beer test works")
            self.current_user.get_untasted
            prompt.keypress("You don't know what are you missing here!!\n\n")
            UserMenu.main_user_menu(UserMenu.current_user)
        when self.menu_choices[:drink_the_most]
            prompt.keypress("I can tell that you really like it\n\n")
            self.current_user.get_most_drank
            prompt.keypress("thanks to you the reviews of this one are going up. Chug Chug Chug!!")
            Menu.pint_pic
            UserMenu.main_user_menu(UserMenu.current_user)
        when "Exit"
            Menu.start_menu

        end
    end
end