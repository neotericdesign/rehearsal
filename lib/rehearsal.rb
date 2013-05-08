require "rehearsal/version"
require "rehearsal/engine"

module Rehearsal
  def self.included(base)
    base.extend ClassMethods
    base.helper_method :rehearsing?,
                       :rehearsing_with_auth?,
                       :rehearsing_with_banner?
    base.before_filter :require_http_basic_auth
  end

  module ClassMethods
    def rehearse_with(username, password)
      class_eval do
        define_method(:username) do
          username
        end

        define_method(:password) do
          password
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
    end if rehearsing_with_auth?
  end

  def rehearsing?
    Rehearsal.config.enabled
  end

  def rehearsing_with_auth?
    rehearsing? && Rehearsal.config.auth_envs.include?(Rails.env.to_sym)
  end

  def rehearsing_with_banner?
    rehearsing? && Rehearsal.config.banner_envs.include?(Rails.env.to_sym)
  end
end
