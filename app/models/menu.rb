class Menu
    @@prompt = TTY::Prompt.new
    # @@box = TTY::Box.frame(width: 30, height: 10) do
    #     "Drawin a box in terminal emulator"
    #   end
    
    def self.prompt
        @@prompt
    end
    
    def self.box
        @@box
    end

    def self.start_menu
        system "clear"
        Ascii.main_title
        self.prompt.keypress("\nPress Any Key To Start")
        self.user_menu
    end

    def self.user_menu
        system "clear"
        user_response = prompt.select("Welcome to Pint Pal!\n\n") do |menu|
            menu.choice "Beer Stats"
            menu.choice "Create User"
            menu.choice "Login"
            menu.choice "Exit"
          end
        system "clear"
        self.user_menu_helper(user_response)  
    end

    def self.user_menu_helper(user_response)
        if user_response == "Create User"
            self.create_user_helper
        elsif user_response == "Login"
            username = prompt.ask("Please enter your username to continue drinking beer:")
            self.login_helper(username)
        elsif user_response == "Beer Stats"
            self.beer_stats_menu
        elsif user_response == "Exit"
            return
        end
    end

    def self.create_user_helper
        name = prompt.ask("Please enter your first and last name:")
        username = prompt.ask("\nPlease create a unique username that embodies your deepest beer thoughts:")
        user = User.find_or_create_by name: name, username: username
        puts "\nWelcome #{name}!"
        # log user in if they are a user already or not
        sleep(1)
        UserMenu.main_user_menu(user)
    end

    def self.login_helper(username)
        user = User.find_or_create_by username: username
        Ascii.welcome_pint
        prompt.keypress("Hello, #{user.name}! Welcome back to your beer journey!")
        UserMenu.main_user_menu(user)
    end

    def self.beer_stats_menu
        system "clear"
        response = prompt.select("Learn more about our beer to make informed beer decisions:\n") do |menu|
            menu.choice "Our most consumed beer"
            menu.choice "Our top ten beers"
            menu.choice "The least popular beer"
            menu.choice "An alphabatized list of our beer"
            menu.choice "An ordered list by ABV"
            menu.choice "Beer FAQS"
            menu.choice "<- Back to main menu"
        end
        self.beer_stats_menu_handler(response)
    end

    def self.beer_stats_menu_handler(response)
        case response 
        when "Our most consumed beer"
            Beer.get_most_drank
        when "Our top ten beers"
            Beer.top_ten
        when "The least popular beer"
            Beer.get_least_drank
        when "An alphabatized list of our beer"
            Beer.alphabatize
        when "An ordered list by ABV"
            Beer.abv
        when "Beer FAQS"
            Ascii.bubble_pint
            Beer.faqs
            prompt.keypress("You are now a beer connoisseur")
            Menu.user_menu
        when "<- Back to main menu"
            Menu.user_menu
        end
    end
end

