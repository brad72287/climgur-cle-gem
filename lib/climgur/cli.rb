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
      elsif input == 'billions'
        billions
      else
        climgur.display_large_image(input)
        commands
    end
  end

  def get_input
    input = 0
    while input != 'start' && input !='exit' && !input.to_i.between?(1, climgur.images.count) && input != 'billions'
      puts "\nenter command: "
      input = gets.strip
    end
    input
  end

  def billions
    puts climgur.large_image("//6336-presscdn-26-82.pagely.netdna-cdn.com/wp-content/uploads/2013/11/carl-sagan.jpg")
    commands
  end

  def goodbye
    puts "goodbye!"
  end
end
