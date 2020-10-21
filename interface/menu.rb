require "tty-prompt"

class Menu
    @@prompt = TTY::Prompt.new

    def self.start_menu
        self.prompt.keypress("\nPress Any Key To Start")
    end
end

Menu.start_menu