require "rehearsal/version"
require "rehearsal/engine"

module Rehearsal
  def self.included(base)
    base.extend ClassMethods
    base.helper_method :rehearsing?
    base.before_filter :require_http_basic_auth
  end

  module ClassMethods
    def rehearse_with(options = {})
      class_eval do
        define_method(:username) do
          options[:username]
        end

        define_method(:password) do
          options[:password]
        end
      end
    end
  end

  class << self
    def configure
      yield(config)
    end

    def config=(config_instance)
      @config = config_instance
    end

    def config
      @config ||= Configuration.new
    end
  end

  private
  def require_http_basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == self.username && password == self.password
    end if rehearsing?
  end

  def rehearsing?
    Rails.env.to_sym == Rehearsal.config.env
  end
end
