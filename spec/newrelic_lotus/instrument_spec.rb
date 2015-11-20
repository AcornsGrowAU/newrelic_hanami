require 'spec_helper'

describe NewRelic::Agent::Instrumentation::Lotus do

  let(:action_klass) do
    Class.new do
      include Lotus::Action

      def self.name
        "Foo::Bar:Controllers::Index"
      end

      def call(params)
        self.body = 'index'
      end
    end
  end

  subject { action_klass.new }

  describe '#call' do
    context 'when newrelic is not enabled' do
      it 'performs action without newrelic trace' do
        ENV['DISABLE_NEW_RELIC_LOTUS'] = 'true'
        DependencyDetection.detect!
        expect(subject).not_to receive(:perform_action_with_newrelic_trace)
        code, headers, body = subject.call({})
      end
    end

    context 'when newrelic is enabled' do
      it 'performs action with newrelic trace' do
        ENV.delete('DISABLE_NEW_RELIC_LOTUS')
        DependencyDetection.detect!
        expect(subject).to receive(:perform_action_with_newrelic_trace)
          .with(
            {
              category: :controller,
              class_name: "Foo::Bar:Controllers::Index",
              name: :call,
              params: {}
            }
          ).and_yield

        code, headers, body = subject.call({})
      end
    end
  end
end
