module Rehearsal
  module ViewHelpers
    def staging_banner(options = {})
      content_tag :div, :id => 'rehearsal-staging-banner' do
        options[:message] || default_message
      end
    end

    private
    def default_message
      'This is your staging banner. Override this text with the :message option.'
    end
  end
end
