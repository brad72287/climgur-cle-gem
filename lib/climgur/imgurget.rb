require 'nokogiri'
require 'open-uri'
require 'pry'
require 'asciiart'

class Climgur::ImgurGet
  attr_accessor :images

  def initialize
    @images = []
  end

  def scrape_main_page
    mainpage = Nokogiri::HTML(open("http://www.imgur.com"))
    mainpage.css("div.post").each do |preview|
      hash = {}
      hash[:description] = preview.css("div.hover p").text
      hash[:preview_url] = preview.css(".image-list-link img").first["src"]
      hash[:full_url] = preview.css(".image-list-link img").first["src"].gsub('b.jpg', '.jpg') #the only difference in URL between a full image and a preview is the letter 'b' on the end
      hash[:type] = preview.css("div.hover div.post-info").text #because I want to filter out galleries and animated gifs
      @images << hash
    end
    @images = @images.select {|x| x[:type].include?('image')} #filtering out only the images
    self
  end

  def display_top_images
    puts "top 5 most popular images on imgur right now: \n --------"
    self.images.each_with_index do |x, index|
       puts "(#{index+1}) "+x[:description]
       puts self.small_image(x[:preview_url])
       puts "\n"
    end
    self
  end

  def small_image(url)
    AsciiArt.new("http:"+url).to_ascii_art(color: true, width: 44)
  end

   def large_image(url)
    AsciiArt.new("http:"+url).to_ascii_art(color: true, width: 122)
  end

end

# hello = Climgur.new
# hello.scrape_main_page
# #puts hello.large_image("//i3.kym-cdn.com/photos/images/newsfeed/000/925/494/218.png_large")
# hello.display_top_five


