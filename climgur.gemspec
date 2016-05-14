# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'climgur/version'

Gem::Specification.new do |spec|
  spec.name          = "climgur"
  spec.version       = Climgur::VERSION
  spec.authors       = ["bradr"]
  spec.email         = ["brad72287@gmail.com"]

  spec.summary       = %q{a command line imgur browser utilizing the asciiart gem}
  spec.homepage      = "https://github.com/brad72287/climgur-cle-gem"
  spec.license       = "MIT"


  #spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  #spec.bindir        = "exe"
  spec.files         = `git ls-files`.split($\)
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib","climgur"]
  spec.executables = ["climgur"]
  #spec.files = ["bin"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
  spec.add_dependency "asciiart"

end
