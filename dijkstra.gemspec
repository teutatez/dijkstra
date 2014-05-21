# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dijkstra/version'

Gem::Specification.new do |spec|
  spec.name          = "dijkstra"
  spec.version       = Dijkstra::VERSION
  spec.authors       = ["teutatez"]
  spec.email         = ["teutatez@gmail.com"]
  spec.summary       = %q{A Ruby implementation of the Dijkstra algorithm as described here: http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
