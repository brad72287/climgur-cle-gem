require 'nokogiri'
require 'open-uri'
require 'pry'
require 'asciiart'

class Climgur
  attr_accessor :images

  def initialize
    @images = []
  end

  def scrape_main_page
    mainpage = Nokogiri::HTML(open("http://www.imgur.com/r/aww"))
    mainpage.css("div.post").each do |preview|
      hash = {}
      hash[:description] = preview.css("div.hover p").text
      hash[:preview_url] = preview.css(".image-list-link img").first["src"]
      hash[:full_url] = preview.css(".image-list-link img").first["src"].gsub('b.jpg', '.jpg')
      hash[:type] = preview.css("div.hover div.post-info").text #because I want to filter out galleries and animated gifs
      @images << hash
    end
    @images = @images.select {|x| x[:type].include?('image')}
    @images
  end

  def display
    self.images.each_with_index do |x, index|
       puts "#{index}. "+x[:description]
       puts self.small_image(x[:preview_url])
       puts ""
    end
  end

  def small_image(url)
    AsciiArt.new("http:"+url).to_ascii_art(color: true, width: 50)
  end

   def large_image(url)
    AsciiArt.new("http:"+url).to_ascii_art(color: true, width: 120)
  end

end

hello = Climgur.new
hello.scrape_main_page
puts hello.large_image("//i.onionstatic.com/avclub/5604/54/16x9/960.jpg")


