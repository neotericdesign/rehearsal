module Rehearsal
  class Configuration
    attr_accessor :env, :enabled

    def initialize
      @env   ||= :staging
      @enabled = true if @enabled.nil?
    end
  end
end
