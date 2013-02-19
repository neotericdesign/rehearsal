module Rehearsal
  class Configuration
    attr_accessor :auth_envs, :banner_envs, :enabled

    def initialize
      @auth_envs   ||= [:staging]
      @banner_envs ||= [:staging]
      @enabled       = !@enabled.nil?
    end
  end
end
