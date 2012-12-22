require 'rehearsal/configuration'
require 'rehearsal/view_helpers'

module Rehearsal
  class Engine < ::Rails::Engine
    initializer "rehearsal.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end

    initializer "rehearsal.action_controller" do
      ActionController::Base.send :include, Rehearsal
    end
  end
end
