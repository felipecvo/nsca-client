require 'spec_helper'

describe NSCA::Client::Message do
  let(:server) { NSCA::Client::RemoteServer.new(:host => '172.0.0.1') }
  let(:host) { NSCA::Client::Host.new(:hostname => 'dummy') }
  let(:service) { NSCA::Client::Service.new(:name => 'TestMessage', :host => host) }

  subject { described_class.new(:ok, 'OK', service, server).to_h }

  its([:nscahost]) { should eq '172.0.0.1' }
  its([:port]) { should eq 5667 }
  its([:hostname]) { should eq 'dummy' }
  its([:service]) { should eq 'TestMessage' }
  its([:return_code]) { should eq 0 }
  its([:status]) { should eq 'OK' }

  context "ok message" do
    subject { described_class.new(:ok, 'OK', service, server) }
    its(:return_code) { should eq 0 }
  end

  context "warn message" do
    subject { described_class.new(:warn, 'WARN', service, server) }
    its(:return_code) { should eq 1 }
  end

  context "critical message" do
    subject { described_class.new(:critical, 'CRITICAL', service, server) }
    its(:return_code) { should eq 2 }
  end
end
