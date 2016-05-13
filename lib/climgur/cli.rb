class CLI

  def call
    puts "welcome to CLIMGUR, the command line imgur browser."
    puts "\ncommands:\n 'start' loads the front page \n enter the number of a image to see it in full size \n 'exit' exits the program\n"
  end

  def get_input
    input = 0
    while input != 'start' && input !='exit' && input < 1 #&& input < [length of array]
      puts "\nenter command: "
      input = gets.strip
    end
  end
end

CLI.new.call