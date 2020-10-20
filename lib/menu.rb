require 'pry'
require "tty-prompt"
require "artii"

class Menu

    attr_reader :art_font, :prompt, :music

    def initialize
        @art_font = Artii::Base.new :font => 'univers'
        @prompt = TTY::Prompt.new
    end

    # def start_music(song)
    #     songPath = os.path.join("/Desktop/Ruby-Practive/music", "/rain.mp3")
    #     pid = fork{ exec 'afplay', song }
    # end

    def stop_music
        pid = fork{ system 'killall', 'afplay' }
    end
    
    def start_menu
        # self.start_music("../music/forest.mp3")
        # self.start_music("../music/rain.mp3")
        fork{ exec 'afplay', "../music/forest.mp3" }
        self.art_font.asciify("RUBY RPG").each_char { |c| putc c; sleep 0.001 }
    end

    def press_to_start
        self.prompt.keypress("\nPress Any Key To Start")
        system "clear"
    end 

    def logo
        puts "    .... NO! ...                  ... MNO! ...
        ..... MNO!! ...................... MNNOO! ...
      ..... MMNO! ......................... MNNOO!! .
     .... MNOONNOO!   MMMMMMMMMMPPPOII!   MNNO!!!! .
      ... !O! NNO! MMMMMMMMMMMMMPPPOOOII!! NO! ....
         ...... ! MMMMMMMMMMMMMPPPPOOOOIII! ! ...
        ........ MMMMMMMMMMMMPPPPPOOOOOOII!! .....
        ........ MMMMMOOOOOOPPPPPPPPOOOOMII! ...  
         ....... MMMMM..    OPPMMP    .,OMI! ....
          ...... MMMM::   o.,OPMP,.o   ::I!! ...
              .... NNM:::.,,OOPM!P,.::::!! ....
               .. MMNNNNNOOOOPMO!!IIPPO!!O! .....
              ... MMMMMNNNNOO:!!:!!IPPPPOO! ....
                .. MMMMMNNOOMMNNIIIPPPOO!! ......
               ...... MMMONNMMNNNIIIOO!..........
            ....... MN MOMMMNNNIIIIIO! OO ..........
         ......... MNO! IiiiiiiiiiiiI OOOO ...........
       ...... NNN.MNO! . O!!!!!!!!!O . OONO NO! ........
        .... MNNNNNO! ...OOOOOOOOOOO .  MMNNON!........
        ...... MNNNNO! .. PPPPPPPPP .. MMNON!........
           ...... OO! ................. ON! .......
              ................................
     "
     .each_char { |c| putc c; sleep 0.01 }
        self.prompt.keypress("\nDIEEEEEE!")
        self.stop_music
        system "clear"
    end
end

menu = Menu.new
menu.start_menu
menu.press_to_start
menu.logo




