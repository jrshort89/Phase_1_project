require 'pry'
require "tty-prompt"
require "artii"

a = Artii::Base.new :font => 'univers'

# puts "here is a line longer and longer osfjajsodfhoahsoidfhoahs".each_char {|c| putc c 
#      sleep 0.09 }
prompt = TTY::Prompt.new

# prompt.ask("What is your name?")

# prompt.select("Choose your destiny?", %w(Scorpion Kano Jax)).each_char

# jake = a.asciify('Ruby RPG').each_char { |c| putc c; sleep 0.001 }
# binding.pry
# puts jake
choice = prompt.select("What size?") do |menu|
     menu.choice name: "small",  value: "small"
     menu.choice name: "medium", value: 2, disabled: "(out of stock)"
     menu.choice name: "large",  value: 3
   end
puts "#{choice} was a bad choice"
puts a.asciify(choice)
