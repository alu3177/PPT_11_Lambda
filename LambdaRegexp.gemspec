# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'LambdaRegexp/version'

Gem::Specification.new do |gem|
  gem.name          = "LambdaRegexp"
  gem.version       = LambdaRegexp::VERSION
  gem.authors       = ["Fernando González López-Peñalver"]
  gem.email         = ["alu0100256543@ull.edu.es"]
  gem.description   = %q{Escriba un módulo que implementa este motor de expresiones regulares. Use module_function para que el espacio de nombres sea incluíble }
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "guard"
  gem.add_development_dependency "guard-rspec"
end
