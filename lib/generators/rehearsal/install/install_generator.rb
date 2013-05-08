module Rehearsal
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    argument :type, :as => :string, :default => 'global'

    def remove_other_config
      case type
      when 'global'
        remove_file ".rehearsal"
      when 'user'
        remove_file "config/initializers/rehearsal.rb"
      end
    end

    def copy_initializer_file
      case type
      when 'global'
        copy_file "initializer.rb", "config/initializers/rehearsal.rb"
      when 'user'
        copy_file "rehearsal.yml", ".rehearsal"
      end
    end

    def add_config_to_gitignore
      if type == 'user'
        append_file(".gitignore", ".rehearsal")
      end
    end
  end
end
