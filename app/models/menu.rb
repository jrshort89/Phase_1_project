class Menu
    @@prompt = TTY::Prompt.new
    @@box = TTY::Box.frame(width: 30, height: 10) do
        "Drawin a box in terminal emulator"
      end
    def self.start_menu
        self.title
        self.prompt.keypress("\nPress Any Key To Start")
        system "clear"
    end

    def self.prompt
        @@prompt
    end

    def self.box
        @@box
    end

    def self.title
        puts "
        ██████╗ ██╗███╗   ██╗████████╗    ██████╗  █████╗ ██╗     
        ██╔══██╗██║████╗  ██║╚══██╔══╝    ██╔══██╗██╔══██╗██║     
        ██████╔╝██║██╔██╗ ██║   ██║       ██████╔╝███████║██║     
        ██╔═══╝ ██║██║╚██╗██║   ██║       ██╔═══╝ ██╔══██║██║     
        ██║     ██║██║ ╚████║   ██║       ██║     ██║  ██║███████╗
        ╚═╝     ╚═╝╚═╝  ╚═══╝   ╚═╝       ╚═╝     ╚═╝  ╚═╝╚══════╝
                                                                  
        "
    end

    def self.user_menu
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
            puts ''
        else
            return
        end
    end

    def self.create_user_helper
        name = prompt.ask("Please enter your first and last name:")
        gender = prompt.ask("Please enter your gender:")
        age = prompt.ask("Please enter your age:")
        location = prompt.ask("Please enter your zip zode:")
        User.find_or_create_by name: name, gender: gender, age: age, location: location
        puts "Welcome #{name}!"
        sleep(3)
    end

    def self.user_login_menu
        
    end
end

