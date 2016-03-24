require 'spec_helper'

describe Speedflow::Plugin::Flowdock::Configuration do
  let(:config) do
    title     = { 'message' => { 'value' => 'hello' } }
    fd_config = { 'token' => 'foo', 'flow' => 'ABC' }
    config    = { '_config' => { 'flowdock' => fd_config } }
    args      = {}.merge(title).merge(config)
    Speedflow::Plugin::Flowdock::Configuration.new(args)
  end

  it '.by_config_key' do
    expect(config.by_config('token', 'default'))
      .to eq 'foo'
  end

  it '.by_input_key' do
    expect(config.by_input('message', 'default'))
      .to eq 'hello'

    expect(config.by_input('notitle', 'default'))
      .to eq 'default'
  end

  it '.by_required_input_key' do
    expect(config.by_required_input('message', 'default'))
      .to eq 'hello'

    expect { config.by_required_input('notitle') }
      .to raise_error(Exception)

    expect { config.by_required_input('nonotitle', 'default') }
      .to raise_error(Exception)
  end
end
