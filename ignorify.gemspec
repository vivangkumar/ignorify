# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ignorify/version'

Gem::Specification.new do |spec|
  spec.name          = "ignorify"
  spec.version       = Ignorify::VERSION
  spec.authors       = ["vivangkumar"]
  spec.email         = ["vivangkumar@gmail.com"]
  spec.summary       = "Pull and add gitignore files from the github repository to your project!"
  spec.description   = "
                        Pull and add gitignore files from the github repository to your project!
                        Ignorify crawls the github/gitignore repository and fetches your .gitignore.
                       "
  spec.homepage      = "https://github.com/vivangkumar/ignorify"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["ignorify"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "thor", "~>0.19", ">= 0.19.1"
  spec.add_development_dependency "nokogiri", "~>1.6", ">= 1.6.5"
  spec.add_development_dependency "colorize", "~>0.7", ">= 0.7.5"
  spec.add_development_dependency "rspec", "~>3.1", ">= 3.1.0"
end
