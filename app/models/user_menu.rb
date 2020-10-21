class UserMenu
    @@prompt = TTY::Prompt.new
    @@current_user = nil
    @@menu_choices = {
        find: "Find a delicious beer to drink",
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
            prompt.keypress("your personalized beer list")
        when self.menu_choices[:find]
            Api.beer_sample_handler
        when self.menu_choices[:tasted_beer]
            prompt.keypress("your tasted beer list")
        when self.menu_choices[:untasted_beer]
            puts "View all untasted beer test works"
        when self.menu_choices[:drink_the_most]
            puts "View the beer you drink the most test and works"
        when "Exit"
            Menu.start_menu
        end
    end
end