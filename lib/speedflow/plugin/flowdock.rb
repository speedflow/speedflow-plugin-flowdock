require 'speedflow/plugin/flowdock/version'
require 'speedflow/plugin/flowdock/configuration'
require 'speedflow/plugin/flowdock/client'

# Speedflow GEM, help you to boost your flow and keep your time.
module Speedflow
  module Plugin
    # Flowdock Speedflow plugin.
    module Flowdock
      # Public: Action notify room.
      #
      # arguments - Hash of arguments.
      #
      # Returns nothing.
      def self.action_notify(arguments)
        Client.new(arguments).notify
      end
    end
  end
end
