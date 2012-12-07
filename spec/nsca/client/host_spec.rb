require 'spec_helper'

describe NSCA::Client::Host do
  subject { described_class.new(:hostname => 'dummy') }
  its(:hostname) { should eq 'dummy' }

  context "current machine" do
    before { Socket.stub(:gethostname).and_return('dummy-client-machine') }
    subject { described_class.current }
    its(:hostname) { should eq 'dummy-client-machine' }
  end
end
