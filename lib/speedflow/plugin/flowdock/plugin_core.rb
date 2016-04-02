require 'tty-prompt'
require 'json'

module Speedflow
  module Plugin
    module Flowdock
      # Plugin core
      class PluginCore
        # @return [Prompt] Plugin prompt.
        attr_writer :prompt

        # @return [Client] Plugin client.
        attr_writer :client

        # @return [Config] Plugin config.
        attr_writer :config

        # Initialize.
        #
        # arguments - Hash of arguments.
        #
        # Examples
        #
        #    Plugin.new({})
        #    # => <Speedflow::Plugin::Flowdock::PluginCore>
        #
        # Returns nothing.
        def initialize(arguments)
          @arguments = arguments
        end

        # Public: Notify.
        #
        # Returns nothing.
        def action_notify
          flow_id_or_token = config.by_input('flow', config.by_config('flow'))

          message = config.by_input('message')
          tags    = config.by_input('tags').split(',')

          client.notify(flow_id_or_token, message, tags)

          prompt.ok '[FLOWDOCK] Flow was notified'
        end

        # Public: Plugin configuration.
        #
        # Returns Configuration instance.
        def config
          @config ||= Configuration.new(@arguments)
        end

        # Public: Plugin client.
        #
        # Returns Client instance.
        def client
          @client ||= Client.new(@config, @prompt)
        end

        # Public: Plugin prompt.
        #
        # Returns Prompt instance.
        def prompt
          @prompt ||= Prompt.new
        end
      end
    end
  end
end
