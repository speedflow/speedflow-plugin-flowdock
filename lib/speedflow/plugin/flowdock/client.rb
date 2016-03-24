require 'flowdock'

module Speedflow
  module Plugin
    module Flowdock
      # Flowdock Client
      class Client
        # @return [::Flowdock::Client] Flowdock client
        attr_writer :flowdock_client

        # Initialize.
        #
        # arguments - Hash of arguments.
        #
        # Returns nothing.
        def initialize(arguments)
          @config = Configuration.new(arguments)
        end

        # Public: notify.
        #
        # Returns nothing.
        def notify
          flow    = @config.by_config('flow')
          message = @config.by_input('message')
          tags    = ['speedflow']

          flowdock_client.chat_message(flow: flow, content: message, tags: tags)
        end

        # Public: Flowdock client
        #
        # Returns flowdock client.
        def flowdock_client
          token = @config.by_config('token')
          @flowdock_client ||= ::Flowdock::Client.new(api_token: token)
        end
      end
    end
  end
end
