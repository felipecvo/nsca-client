module NSCA
  module Client
    class RemoteServer
      attr_reader :host, :port

      def initialize(options)
        @host = options[:host]
        @port = options[:port] || 5667
      end
    end
  end
end
