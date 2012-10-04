require "neoteric-protection/version"

module Neoteric
  module Protection
    def self.included(base)
      base.extend ClassMethods
      base.helper_method :staging?
      base.before_filter :require_http_basic_auth
    end

    module ClassMethods
      def username(name)
        class_eval do
          define_method(:username) do
            name
          end
        end
      end
    end

    private
    def require_http_basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == self.username && password == 'neoteric'
      end if staging?
    end

    def staging?
      Rails.env.staging?
    end
  end
end
