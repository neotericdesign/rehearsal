# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rehearsal/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joe Sak", "Nic Aitch"]
  gem.email         = ["joe@neotericdesign.com", "nic@neotericdesign.com"]
  gem.description   = %q{Quickly add Staging Env. HTTP basic auth to your project}
  gem.summary       = %q{Easy HTTP Basic Auth for Staging Rails Apps}
  gem.homepage      = ""

  gem.files         = Dir["{app,config,db,lib,vendor}/**/*"] + ["Rakefile", "README.md"]
  gem.require_paths = ["lib"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rehearsal"
  gem.version       = Rehearsal::VERSION

  gem.add_dependency 'rails', '>= 3.0.20', '< 4.0.0'
end
