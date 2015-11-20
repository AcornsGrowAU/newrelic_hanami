require 'new_relic/agent/instrumentation'
require 'new_relic/agent/instrumentation/controller_instrumentation'
require 'lotus/controller'

module NewRelic
  module Agent
    module Instrumentation
      module Lotus
        include ControllerInstrumentation

        protected

        def call(env)
          @newrelic_method = __method__
          perform_action_with_newrelic_trace(_trace_options) do
            super(env)
          end
        end

        private

        def _trace_options
          {
            category:   :controller,
            class_name: self.class.name,
            name:       @newrelic_method,
            params:     params.to_h
          }
        end
      end
    end
  end
end

DependencyDetection.defer do
  @name = :lotus

  depends_on do
    defined?(::Lotus) && !::NewRelic::Control.instance['disable_lotus'] && !ENV['DISABLE_NEW_RELIC_LOTUS']
  end

  executes do
    NewRelic::Agent.logger.info 'Installing Lotus instrumentation'
  end

  executes do
    ::Lotus::Controller.configure do
      prepare do
        prepend ::NewRelic::Agent::Instrumentation::Lotus
      end
    end
  end
end
