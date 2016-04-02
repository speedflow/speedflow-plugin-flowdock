require 'speedflow/plugin/flowdock/version'
require 'speedflow/plugin/flowdock/plugin_core'
require 'speedflow/plugin/flowdock/prompt'
require 'speedflow/plugin/flowdock/configuration'
require 'speedflow/plugin/flowdock/client'

# Speedflow GEM, help you to boost your flow and keep your time.
module Speedflow
  module Plugin
    # Flowdock Speedflow plugin.
    module Flowdock
      # TODO: Move this system in the core Utils
      class << self
        ACTIONS = [
          :action_notify
        ].freeze

        # @return [Speedflow::Plugin::Flowdock.PluginCore] Plugin.
        attr_writer :plugin

        # Public: Magic method to route to action
        #
        # args - Some arguments :)
        #
        # Returns nothing.
        def method_missing(*args)
          action = args.first

          raise NoMethodError, action unless ACTIONS.include? action

          plugin.new(args.last).send(action)
        end

        # Public: Plugin.
        #
        # Returns Speedflow::Plugin::Flowdock.PluginCore instance.
        def plugin
          @plugin ||= PluginCore
        end
      end
    end
  end
end
