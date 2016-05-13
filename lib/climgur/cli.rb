class CLI

  def call
    puts "welcome to CLIMGUR, the command line imgur browser."
    commands
  end

  def commands
    puts "\ncommands:\n 'start' loads previews of the top 5 most popular images right now \n enter the number of a image (1-5) to see it in full size \n 'exit' exits the program\nbonus commands: 'kappa'"
    input = get_input
    if input == 'start'
       #display_top_five
       commands
      elsif input == 'end'
        goodbye
      else
        #output the image selection
        commands #recursion?
    end
  end

  def get_input
    input = 0
    while input != 'start' && input !='exit' && input.to_i < 1 && input.to_i < 5
      puts "\nenter command: "
      input = gets.strip
    end
    input
  end

  def goodbye
    puts "so long and thanks for all the fish."
  end
end

CLI.new.call