class Ascii
    attr_reader :main_title

    @@prompt = TTY::Prompt.new

    def self.prompt
        @@prompt
    end

    @@beer = [
        "     
        ██████╗ ██╗███╗   ██╗████████╗    ██████╗  █████╗ ██╗     
        ██╔══██╗██║████╗  ██║╚══██╔══╝    ██╔══██╗██╔══██╗██║     
        ██████╔╝██║██╔██╗ ██║   ██║       ██████╔╝███████║██║     
        ██╔═══╝ ██║██║╚██╗██║   ██║       ██╔═══╝ ██╔══██║██║     
        ██║     ██║██║ ╚████║   ██║       ██║     ██║  ██║███████╗
        ╚═╝     ╚═╝╚═╝  ╚═══╝   ╚═╝       ╚═╝     ╚═╝  ╚═╝╚══════╝
                                                ",
"         . .
        .. . *.
 - -_ _-__-0oOo
  _-_ -__ -||||)
     ______||||______
 ~~~~~~~~~~`""'",
 "
  _.._..,_,_
 (          )
  ]~,\"-.-~~[
.=])' (;  ([
| ]:: '    [
'=]): .)  ([
  |:: '    |
   ~~----~~"]

    def self.beer
        @@beer
    end

    def self.array_maker(string)
        arr = string.split("\n")
    end

    def self.main_title
        puts self.beer[0]
    end

    def self.welcome_pint
        system "clear"
        puts self.beer[1]
    end

    def self.bubble_pint
        puts self.beer[2]
    end

    def self.vertical_scroller(ascii)
        ascii.each do |elm| 
            puts elm
            sleep(0.5)
        end
    end

    def self.horizontal_scroller(ascii)
        self.array_maker(ascii).each do |string| 
            string.each_char {|x| print x; sleep(0.01)}
            puts "\n"
        end
    end
end