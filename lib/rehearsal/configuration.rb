module Rehearsal
  class Configuration
    attr_accessor :env, :enabled

    def initialize
      @env   ||= :staging
      @enabled = false if @enabled.nil?
    end
  end
end
