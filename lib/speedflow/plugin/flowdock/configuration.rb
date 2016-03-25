module Speedflow
  module Plugin
    module Flowdock
      # Flowdock Configuration
      class Configuration
        CONFIG_KEY = '_config'.freeze
        PLUGIN_KEY = 'flowdock'.freeze

        # Initialize.
        #
        # arguments - Hash of arguments.
        #
        # Examples
        #
        #    Configuration.new({})
        #    # => <Speedflow::Plugin::Flowdock::Configuration>
        #
        # Returns nothing.
        def initialize(arguments)
          @arguments = arguments
        end

        # Public: Get a specific config.
        #
        # key           - Key of config.
        # default_value - Default value.
        #
        # Returns value of config key.
        def by_config(key, default_value = '')
          if @arguments.key?(CONFIG_KEY) &&
             @arguments[CONFIG_KEY].key?(PLUGIN_KEY)
            config = @arguments[CONFIG_KEY][PLUGIN_KEY]
          end
          config.key?(key) ? config[key] : default_value
        end

        # Public: Get an input config by key.
        #
        # key           - Key of config.
        # default_value - Default value.
        #
        # Returns value of input config key.
        def by_input(key, default_value = '')
          if @arguments.key?(key)
            @arguments[key]['value']
          else
            default_value
          end
        end

        # Public: Get an input config by key but required.
        #
        # key           - Key of config.
        # default_value - Default value.
        #
        # Returns value of input config key or Exception.
        def by_required_input(key, default_value = '')
          value = by_input(key, default_value)

          # TODO: Improve communication with core for errors
          if by_input(key).empty?
            raise Exception, "Required value for '#{key}'."
          end

          value
        end
      end
    end
  end
end
