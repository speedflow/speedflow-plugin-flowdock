require 'spec_helper'

describe Speedflow::Plugin::Flowdock::Prompt do
  let(:prompt) do
    prompt = ::Speedflow::Plugin::Flowdock::Prompt.new
    prompt.prompt = double
    prompt
  end
  let(:exception) do
    double(message: "Error\n")
  end

  it '.ok' do
    allow(prompt.prompt)
      .to receive(:ok).with('Test')

    expect(prompt.ok('Test'))
  end

  it '.errors' do
    allow(prompt.prompt)
      .to receive(:error).with('Flowdock errors')
    allow(prompt.prompt)
      .to receive(:warn).with("Error\n")

    expect(prompt.errors(exception))
  end
end
