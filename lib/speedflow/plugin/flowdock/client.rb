require 'flowdock'

module Speedflow
  module Plugin
    module Flowdock
      # Flowdock client
      class Client
        # @return [Prompt] Prompt.
        attr_writer :prompt

        # @return [Flowdock::Client] Flowdock client.
        attr_writer :flowdock_client

        # Initialize.
        #
        # config - Speedflow::Plugin::Flowdock::Configuration instance.
        # prompt - Speedflow::Plugin::Flowdock::Prompt instance.
        #
        # Examples
        #
        #    Client.new({}, Speedflow::Plugin::Flowdock::Prompt.new)
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
          prompt.errors exception
          abort
        end

        # Public: Flowdock client.
        #
        # Returns ::Flowdock::Client instance.
        def flowdock_client
          @flowdock_client ||= ::Flowdock::Client.new(@config.auth)
        end

        # Public: Prompt.
        #
        # Returns ::Speedflow::Plugin::Flowdock::Prompt instance.
        def prompt
          @prompt ||= ::Speedflow::Plugin::Flowdock::Prompt.new
        end
      end
    end
  end
end
