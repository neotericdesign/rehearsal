require "rehearsal/version"
require "rehearsal/engine"

module Rehearsal
  def self.included(base)
    base.extend ClassMethods
    base.helper_method :staging?
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

  private
  def require_http_basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == self.username && password == self.password
    end if staging?
  end

  def staging?
    Rails.env.staging?
  end
end
