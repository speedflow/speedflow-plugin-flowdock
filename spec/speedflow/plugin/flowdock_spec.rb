require 'spec_helper'

describe Speedflow::Plugin::Flowdock do
  let(:plugin) do
    double(new: double(action_notify: nil))
  end

  it 'has a version number' do
    expect(Speedflow::Plugin::Flowdock::VERSION).not_to be nil
  end

  it 'has an action catcher' do
    expect { Speedflow::Plugin::Flowdock.action_lol }
      .to raise_error(NoMethodError)

    Speedflow::Plugin::Flowdock.plugin = plugin

    expect(Speedflow::Plugin::Flowdock.action_notify).to eq nil
  end
end
