require 'send_nsca'

module NSCA
  module Client
    class Notifier
      def initialize(message)
        @message = message
      end

      def send_nsca
        connection = SendNsca::NscaConnection.new(@message.to_h)
        connection.send_nsca
        true
      end
    end
  end
end
