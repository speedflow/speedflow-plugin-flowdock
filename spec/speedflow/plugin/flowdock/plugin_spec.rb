require 'spec_helper'

describe Speedflow::Plugin::Flowdock::Plugin do
  let(:plugin) do
    plugin = ::Speedflow::Plugin::Flowdock::Plugin.new(double, double)
    plugin.client = double
    plugin
  end

  it '.action_notify' do
    allow(plugin.config)
      .to receive(:by_config)
      .with('flow')
      .and_return('XXX')
    allow(plugin.config)
      .to receive(:by_input)
      .with('flow', 'XXX')
      .and_return('XXX')
    allow(plugin.config)
      .to receive(:by_input)
      .with('message')
      .and_return('Hello')
    allow(plugin.config)
      .to receive(:by_input)
      .with('tags')
      .and_return('foo,bar,baz')

    allow(plugin.prompt)
      .to receive(:ok)
      .with('[FLOWDOCK] Flow was notified')

    allow(plugin.client)
      .to receive(:notify)
      .with('XXX', 'Hello', %w(foo bar baz))

    expected_hash = { 'message' => 'Hello', 'tags' => %w(foo bar baz) }
    expect(plugin.action_notify)
      .to eq expected_hash
  end
end
