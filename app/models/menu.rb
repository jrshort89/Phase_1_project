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
        self.title
        self.prompt.keypress("\nPress Any Key To Start")
        self.user_menu
    end

    def self.title
        system "clear"
        puts "
        ██████╗ ██╗███╗   ██╗████████╗    ██████╗  █████╗ ██╗     
        ██╔══██╗██║████╗  ██║╚══██╔══╝    ██╔══██╗██╔══██╗██║     
        ██████╔╝██║██╔██╗ ██║   ██║       ██████╔╝███████║██║     
        ██╔═══╝ ██║██║╚██╗██║   ██║       ██╔═══╝ ██╔══██║██║     
        ██║     ██║██║ ╚████║   ██║       ██║     ██║  ██║███████╗
        ╚═╝     ╚═╝╚═╝  ╚═══╝   ╚═╝       ╚═╝     ╚═╝  ╚═╝╚══════╝
                                                                  
        "
    end

    def self.pint_pic
        puts "         . .
        .. . *.
 - -_ _-__-0oOo
  _-_ -__ -||||)
     ______||||______
 ~~~~~~~~~~`""'"
    end

    def self.user_menu
        system "clear"
        user_response = prompt.select("Welcome to Pint Pal!\n\n") do |menu|
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
        else
            return
        end
    end

    def self.create_user_helper
        name = prompt.ask("Please enter your first and last name:")
        username = prompt.ask("Please create a unique username that embodies your deepest beer thoughts:")
        User.find_or_create_by name: name, username: username
        puts "Welcome #{name}!"
        # log user in if they are a user already or not
        sleep(3)
    end

    def self.login_helper(username)
        user = User.find_by username: username
        self.pint_pic
        prompt.keypress("Hello, #{user.name}! Welcome back to your beer journey!")
        UserMenu.main_user_menu(user)
    end
end

