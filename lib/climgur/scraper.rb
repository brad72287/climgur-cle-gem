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
    mainpage = Nokogiri::HTML(open("http://www.imgur.com"))
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
    AsciiArt.new("http:"+url).to_ascii_art(color: true, width: 150)
  end

  def url_to_full(preview_url)

  end


end

hello = Climgur.new
puts hello.scrape_main_page
#hello.display
#hello.display
# Scraper.new.geturl.css("div.cards div.hover p").each {|x| puts x.text}  #preview description title
# Scraper.new.geturl.css(".image-list-link img").each {|x| puts x['src']} #preview image url

# foo = []
# Scraper.new.geturl.css("div.post").each do |preview|
#   bar = {}
#   bar[:description] = preview.css("div.hover p").text
#   bar[:preview_url] = preview.css(".image-list-link img").first["src"]
#   foo << bar
# end

# puts foo[1][:preview_url]

# x=0
# while x < 5
#   a = AsciiArt.new("http:"+foo[x][:preview_url])
#   puts foo[x][:description]
#   puts a.to_ascii_art(color: true, width: 30)
#   x+=1
# end


