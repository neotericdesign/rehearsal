module Rehearsal
  module ViewHelpers
    def rehearsal_banner(options = {})
      return unless rehearsing?

      content_tag :div, :id => 'rehearsal-banner' do
        options[:message] || default_message
      end
    end

    private
    def default_message
      'This is your rehearsal banner. Override this text with the :message option.'
    end
  end
end
