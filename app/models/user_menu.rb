class UserMenu
    @@prompt = TTY::Prompt.new
    @@current_user = nil
    @@menu_choices = {
        find: "Feeling lucky",
        search: "Search for beers by style",
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
        when self.menu_choices[:beer_list] #your personal beer options
            Ascii.welcome_pint
            self.current_user.get_beers
            #this should be get_beer method
            # self.current_user.get_beers
        when self.menu_choices[:find]
            Api.beer_sample_handler
        when self.menu_choices[:search]
            #this should lead to a search list
            Api.beer_style_menu
            UserMenu.main_user_menu(UserMenu.current_user)
        when self.menu_choices[:tasted_beer] #The ones that you order/pay
            Ascii.bubble_pint
            prompt.keypress("So far you have tried these beers\n\n")
            self.current_user.get_tasted
            prompt.keypress("Seriously!! just that!!\n\n")
            UserMenu.main_user_menu(UserMenu.current_user)
        when self.menu_choices[:untasted_beer] #the ones that are still on your list but you haven't tried
            Ascii.bubble_pint
            self.current_user.get_untasted
            prompt.keypress("\n\nYou don't know what are you missing here!!\n\n")
        when self.menu_choices[:drink_the_most]#the most recurrent from your tasted_beer list
            prompt.keypress("I can tell that you really like it\n\n")
            self.current_user.get_most_drank
            prompt.keypress("\nThanks to your commitment to this beer, you are single handedly making the brewer rich! Chug Chug Chug!!")
            Ascii.bubble_pint

            UserMenu.main_user_menu(UserMenu.current_user)
        when "Exit"
            Menu.start_menu

        end
    end
end