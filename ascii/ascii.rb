class Ascii
    attr_reader :main_title

    @@beer = []

    def self.beer
        @@beer
    end

    def self.main_title
        puts "
        ██████╗ ██╗███╗   ██╗████████╗    ██████╗  █████╗ ██╗     
        ██╔══██╗██║████╗  ██║╚══██╔══╝    ██╔══██╗██╔══██╗██║     
        ██████╔╝██║██╔██╗ ██║   ██║       ██████╔╝███████║██║     
        ██╔═══╝ ██║██║╚██╗██║   ██║       ██╔═══╝ ██╔══██║██║     
        ██║     ██║██║ ╚████║   ██║       ██║     ██║  ██║███████╗
        ╚═╝     ╚═╝╚═╝  ╚═══╝   ╚═╝       ╚═╝     ╚═╝  ╚═╝╚══════╝
                                                                  
        "
    end

    def self.welcome_pint
        system "clear"
        puts "         . .
        .. . *.
 - -_ _-__-0oOo
  _-_ -__ -||||)
     ______||||______
 ~~~~~~~~~~`""'"
    end

    def self.bubble_pint
        puts "         _.._..,_,_
        (          )
         ]~,\"-.-~~[
       .=])' (;  ([
       | ]:: '    [
       '=]): .)  ([
         |:: '    |
          ~~----~~"
    end

    
end