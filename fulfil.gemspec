# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fulfil/version'

Gem::Specification.new do |spec|
  spec.name          = "fulfil"
  spec.version       = Fulfil::VERSION
  spec.authors       = ["Manoj M J"]
  spec.email         = ["manojmj92@gmail.com"]
  spec.summary       = %q{fulfil.io REST API Gem}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/manojmj92/fulfil-ruby"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", '~> 10.4', '>= 10.4.2'
  spec.add_development_dependency "rspec", '~> 3.5'
  spec.add_dependency 'curb', '~> 0.9.3'
  spec.add_dependency 'json',  '~> 2.0', '>= 2.0.1'
end
