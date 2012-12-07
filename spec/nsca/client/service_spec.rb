require 'spec_helper'

describe NSCA::Client::Service do
  let(:host) { NSCA::Client::Host.new(:hostname => 'asdf') }
  subject { described_class.new(:name => 'TestMessage', :host => host) }

  its(:name) { should eq 'TestMessage' }
  its(:host) { should eq host }

  context "default host to current machine" do
    subject { described_class.new(:name => 'SimpleMessage') }

    its(:name) { should eq 'SimpleMessage' }
    its(:host) { should be_a NSCA::Client::Host }
  end
end
