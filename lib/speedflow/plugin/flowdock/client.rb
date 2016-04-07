require 'flowdock'

module Speedflow
  module Plugin
    module Flowdock
      # Flowdock client
      class Client
        # @return [Speedflow::Plugin::Configuration] Plugin configuration.
        attr_reader :config

        # @return [Speedflow::Plugin::Prompt] Plugin prompt.
        attr_reader :prompt

        # @return [Flowdock::Client] Flowdock client.
        attr_writer :flowdock_client

        # Initialize.
        #
        # config - <Speedflow::Plugin::Configuration> instance.
        # prompt - <Speedflow::Plugin::Prompt> instance.
        #
        # Examples
        #
        #    Client.new({}, Speedflow::Plugin::Prompt.new)
        #    # => <Speedflow::Plugin::Flowdock::Client>
        #
        # Returns nothing.
        def initialize(config, prompt)
          @config = config
          @prompt = prompt
        end

        # Public: Notify.
        #
        # flow_id - Flow ID.
        # message - String of message.
        # tags    - Array of tags / Just add "Speedflow" tags 8-).
        #
        # Returns nothing.
        def notify(flow_id, message, tags)
          safe do
            tags = ['Speedflow'].concat(tags)
            flowdock_client.chat_message(
              flow: flow_id, content: message, tags: tags)
          end
        end

        # Public: Safe process Flowdock action.
        #
        # Returns nothing.
        def safe
          yield
        rescue ::Flowdock::ApiError => exception
          prompt.errors 'Flowdock', exception
          abort
        end

        # Public: Flowdock client.
        #
        # Returns <::Flowdock::Client> instance.
        def flowdock_client
          config = { api_token: @config.by_config('token') }
          @flowdock_client ||= ::Flowdock::Client.new(config)
        end
      end
    end
  end
end
