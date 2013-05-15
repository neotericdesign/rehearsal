require 'buildgem'

Buildgem.configure do |config|
  config.git_push_tags = true
  config.gem_source    = :rubygems
end
