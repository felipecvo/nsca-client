require 'spec_helper'

describe NSCA::Client::Notifier do
  let(:server) { NSCA::Client::RemoteServer.new(:host => '172.0.0.1') }
  let(:host) { NSCA::Client::Host.new(:hostname => 'dummy') }
  let(:service) { NSCA::Client::Service.new(:name => 'TestMessage', :host => host) }
  let(:message) { NSCA::Client::Message.new(:ok, 'OK', service, server) }

  context "send message successfully" do
    before do
      SendNsca::NscaConnection.any_instance.should_receive(:send_nsca)
    end

    let(:notifier) { NSCA::Client::Notifier.new(message) }

    subject { notifier.send_nsca }

    it { should be_true }
  end
end
