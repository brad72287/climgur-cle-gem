require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def geturl
    file = Nokogiri::HTML(open("http://www.imgur.com"))
    #binding.pry
  end

end

Scraper.new.geturl.css("div.cards div.hover p").each {|x| puts x.text}
Scraper.new.geturl.css(".image-list-link img").each {|x| puts x['src']}