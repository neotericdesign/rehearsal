module Rehearsal
  module ViewHelpers
    def rehearsal_banner(message = nil)
      return unless rehearsing?

      content_tag :div, :id => 'rehearsal-banner' do
        if block_given?
          yield
        else
          message || default_message
        end
      end
    end

    private
    def default_message
      'Override this message by passing in a string or a block.'
    end
  end
end
