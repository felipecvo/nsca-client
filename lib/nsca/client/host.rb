require 'socket'

module NSCA
  module Client
    class Host
      attr_reader :hostname

      def initialize(options)
        @hostname = options[:hostname]
      end

      def self.current
        Host.new(:hostname => Socket.gethostname)
      end
    end
  end
end
