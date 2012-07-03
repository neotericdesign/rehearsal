require "neoteric-protection/version"

module Neoteric
  module Protection
    extend ActiveSupport::Concern

    included do
      helper_method :staging?
      before_filter :require_http_basic_auth
    end

    private
    def require_http_basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['STAGING_USERNAME'] && password == ENV['STAGING_PASSWORD']
      end if staging?
    end

    def staging?
      Rails.env.staging?
    end
  end
end
