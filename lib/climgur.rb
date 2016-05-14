require 'nokogiri'
require 'open-uri'
require 'pry'
require 'asciiart'

require_relative "climgur/version"
require_relative "climgur/cli"
require_relative "climgur/imgurget"

module Climgur

end

new = Climgur::CLI.new.start
