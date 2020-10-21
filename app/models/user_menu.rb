class UserMenu
    @@prompt = TTY::Prompt.new

    def self.prompt
        @@prompt
    end

    def self.main_user_menu(user)
        system "clear"
        user_response = prompt.select("#{user.name}, choose your beer adventure:") do |menu|
            menu.choice "Find delicious beer to drink"
            menu.choice "View your beer list"
            menu.choice "View all tasted beer"
            menu.choice "View all untasted beer"
            menu.choice "View the beer you drink the most"
            menu.choice "Go on a beer adventure"
            menu.choice "Exit"
          end
        self.main_menu_helper(user_response)
    end

    def self.main_menu_helper(user_response)
        system "clear"
        case user_response
        when "Find delicious beer to drink"
            prompt.keypress("some beer list magic")
            # self.create_user_helper
        when "View your beer list"
            prompt.keypress("your personalize beer list")
            # username = prompt.ask("Please enter your username to continue drinking beer:")
            # self.login_helper(username)
        when "Exit"
            Menu.start_menu
        end
    end
end