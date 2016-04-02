require 'spec_helper'

describe Speedflow::Plugin::Flowdock::Configuration do
  let(:config) do
    message     = { 'value' => 'hello' }
    tags        = { 'value' => 'foo,bar,baz' }
    jira_config = { 'token' => 'foo', 'flow' => 'bar' }
    config      = { 'flowdock' => jira_config }
    args        = { 'tags' => tags, 'message' => message, '_config' => config }
    Speedflow::Plugin::Flowdock::Configuration.new(args)
  end

  it '.by_config' do
    expect(config.by_config('token', 'default'))
      .to eq 'foo'
  end

  it '.by_input' do
    expect(config.by_input('message', 'default'))
      .to eq 'hello'

    expect(config.by_input('tags'))
      .to eq 'foo,bar,baz'

    expect(config.by_input('nomessage', 'default'))
      .to eq 'default'
  end

  it '.by_required_input' do
    expect(config.by_required_input('message', 'default'))
      .to eq 'hello'

    expect { config.by_required_input('nomessage') }
      .to raise_error(Exception)

    expect { config.by_required_input('nonomessage', 'default') }
      .to raise_error(Exception)
  end

  it '.auth' do
    returned_hash = {
      api_token:    'foo'
    }

    expect(config.auth)
      .to eq returned_hash
  end
end
