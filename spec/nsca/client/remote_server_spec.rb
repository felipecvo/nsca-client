require 'spec_helper'

describe NSCA::Client::RemoteServer do
  subject { described_class.new(:host => '172.0.0.1') }
  its(:host) { should eq '172.0.0.1' }
  its(:port) { should eq 5667 }

  context "custom port" do
    subject { described_class.new(:port => 12345) }
    its(:port) { should eq 12345 }
  end
end
