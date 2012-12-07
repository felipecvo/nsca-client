module NSCA
  module Client
    class Message
      CODE = { :ok => 0, :warn => 1, :critical => 2 }

      attr_reader :return_code

      def initialize(alert, status, service, remote_server)
        @return_code = CODE[alert]
        @status = status
        @service = service
        @remote_server = remote_server
      end

      def to_h
        {
          :nscahost    => @remote_server.host,
          :port        => @remote_server.port,
          :hostname    => @service.host.hostname,
          :service     => @service.name,
          :return_code => @return_code,
          :status      => @status
        }
      end
    end
  end
end
