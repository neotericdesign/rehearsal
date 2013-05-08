module Rehearsal
  class Configuration
    attr_accessor :auth_envs, :banner_envs, :enabled

    def initialize
      initialize_from_hidden_file!

      @auth_envs   ||= [:staging]
      @banner_envs ||= [:staging]
      @enabled       = true if enabled.nil?
    end

    private
    def initialize_from_hidden_file!
      return unless File.exist?(hidden_file_path)

      file    = File.open(hidden_file_path)
      config  = YAML.load(file)

      config.each do |attr, value|
        if value.respond_to?(:split)
          value = value.split(',').map(&:strip).map(&:to_sym)
        end

        self.send("#{attr}=", value)
      end
    end

    def hidden_file_path
      "#{Rails.root}/.rehearsal"
    end
  end
end
