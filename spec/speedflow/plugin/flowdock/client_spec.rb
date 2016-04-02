require 'spec_helper'

describe Speedflow::Plugin::Flowdock::Client do
  let(:client) do
    client = ::Speedflow::Plugin::Flowdock::Client.new(double, double)
    client.flowdock_client = double
    client
  end

  it '.notify' do
    allow(client.flowdock_client).to receive(:chat_message)

    client.notify('XXX', 'Hello', %w(foo bar baz))
  end

  it '.safe' do
    allow(client.prompt)
      .to receive(:error)
      .with('Flowdock errors')
    allow(client.prompt)
      .to receive(:errors)
    e = expect do
      client.safe do
        raise ::Flowdock::ApiError.new('Error'), '...'
      end
    end
    e.to raise_error(SystemExit)
  end
end
