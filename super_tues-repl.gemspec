# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'super_tues/repl/version'

Gem::Specification.new do |spec|
  spec.name          = "super_tues-repl"
  spec.version       = SuperTues::Repl::VERSION
  spec.authors       = ["John House"]
  spec.email         = ["jonlhouse@gmail.com"]
  spec.summary       = %q{SuperTues command line REPL game.}
  spec.description   = %q{Console version of the SuperTuesday game.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

end
