require 'nokogiri'
require 'open-uri'
require 'pry'
require 'asciiart'

class Climgur
  attr_accessor:

  def scrape-main-page
    mainpage = Nokogiri::HTML(open("http://www.imgur.com"))
    mainpage.css("div.post").each do |preview|
    bar = {}
    bar[:description] = preview.css("div.hover p").text
    bar[:preview_url] = preview.css(".image-list-link img").first["src"]
    foo << bar
end
    
    #binding.pry
  end

end

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


