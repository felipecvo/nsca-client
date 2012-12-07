require 'spec_helper'

describe NSCA::Client do
  let(:service) { NSCA::Client::Service.new(:name => 'TestMessage') }

  before(:all) do
    NSCA::Client.servers << NSCA::Client::RemoteServer.new(:host => '172.0.0.1')
  end

  before(:each) do
    SendNsca::NscaConnection.any_instance.should_receive(:send_nsca)
  end

  context "normal service operation" do
    it "should notify" do
      NSCA::Client.ok(service).should be_true
    end
  end

  context "unstable service operation" do
    it "should notify" do
      NSCA::Client.warning(service).should be_true
    end
  end

  context "critical service state" do
    it "should notify" do
      NSCA::Client.critical(service).should be_true
    end
  end
end
