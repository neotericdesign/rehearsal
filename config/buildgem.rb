require 'buildgem'

Buildgem.configure do |config|
  config.gem_path = "."
  config.gem_top_level_namespace = "rehearsal"
end
