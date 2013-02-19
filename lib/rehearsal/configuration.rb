module Rehearsal
  class Configuration
    attr_accessor :envs, :enabled

    def initialize
      @envs   ||= [:staging]
      @enabled = false if @enabled.nil?
    end
  end
end
