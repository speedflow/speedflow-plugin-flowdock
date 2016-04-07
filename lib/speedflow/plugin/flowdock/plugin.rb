module Speedflow
  module Plugin
    module Flowdock
      # Plugin core
      class Plugin < Speedflow::Plugin::Abstract
        # @return [<Speedflow::Flowdock::Client>] Plugin client.
        attr_writer :client

        # Public: Notify.
        #
        # Returns Hash of result.
        def action_notify
          flow_id_or_token = config.by_input('flow', config.by_config('flow'))

          message = config.by_input('message')
          tags    = config.by_input('tags').split(',')

          client.notify(flow_id_or_token, message, tags)

          prompt.ok '[FLOWDOCK] Flow was notified'

          # ACTION: action_notify
          # OUTPUT: { 'message' => String, 'tags' => [] }
          { 'message' => message, 'tags' => tags }
        end

        # Public: Plugin client.
        #
        # Returns <Speedflow::Flowdock::Client> instance.
        def client
          @client ||= Client.new(@config, @prompt)
        end
      end
    end
  end
end
