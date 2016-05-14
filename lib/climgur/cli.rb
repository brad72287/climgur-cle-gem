class Climgur::CLI

  attr_accessor :climgur

  def initialize
    @climgur = nil
  end

  def start
    @climgur = Climgur::ImgurGet.new.scrape_main_page
    puts "welcome to CLIMGUR, the command line imgur browser."
    commands
  end

  def commands
    puts "\ncommands:\n 'start' loads previews of the most popular images right now \n enter the number of a image to see it in full size \n 'exit' exits the program\n"
    input = get_input
    if input == 'start'
       climgur.display_top_images
       commands
      elsif input == 'exit'
        goodbye
      else
        #output the image selection
        commands
    end
  end

  def get_input
    input = 0
    while input != 'start' && input !='exit' && input.to_i < 1 && input.to_i > @climgur.images.count
      puts "\nenter command: "
      input = gets.strip
    end
    input
  end

  def goodbye
    puts "so long and thanks for all the fish."
  end
end

#CLI.new.call