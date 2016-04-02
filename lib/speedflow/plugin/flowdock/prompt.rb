require 'tty-prompt'
require 'json'

module Speedflow
  module Plugin
    module Flowdock
      # Plugin prompt
      class Prompt # < TTY::Prompt
        # @return [TTY::Prompt] TTY::Prompt.
        attr_writer :prompt

        # Public: Errors from Flowdock exception.
        #
        # exception - Flowdock::ApiError.
        #
        # Returns nothing.
        def errors(exception)
          prompt.error 'Flowdock errors'
          prompt.warn exception.message
        end

        # Delegate.
        #
        # method - Method.
        # args   - Arguments.
        # block  - Block.
        #
        # Returns wathever.
        def method_missing(method, *args, &block)
          prompt.send(method, *args, &block)
        end

        # Public: TTY prompt.
        #
        # Returns ::TTY::Prompt instance.
        def prompt
          @prompt ||= ::TTY::Prompt.new
        end
      end
    end
  end
end
