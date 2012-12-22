module Rehearsal
  class Configuration
    attr_accessor :env

    def initialize
      @env ||= :staging
    end
  end
end
