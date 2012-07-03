# -*- encoding: utf-8 -*-
require File.expand_path('../lib/neoteric-protection/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joe Sak"]
  gem.email         = ["joe@neotericdesign.com"]
  gem.description   = %q{Quickly add Staging Env. HTTP basic auth to your project}
  gem.summary       = %q{Easy HTTP Basic Auth for Staging Rails Apps}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "neoteric-protection"
  gem.require_paths = ["lib"]
  gem.version       = Neoteric::Protection::VERSION

  gem.add_dependency 'activesupport'
end
