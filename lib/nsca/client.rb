require 'nsca/client/host'
require 'nsca/client/message'
require 'nsca/client/notifier'
require 'nsca/client/remote_server'
require 'nsca/client/service'
require 'nsca/client/version'

module NSCA
  module Client
    class << self
      def servers
        @servers ||= []
      end

      def ok(service, message = 'OK')
        status = false
        servers.each do |server|
          message = Message.new(:ok, message, service, server)
          notifier = Notifier.new(message)
          status = true if notifier.send_nsca
        end
        status
      end

      def warning(service, message = 'WARNING')
        status = false
        servers.each do |server|
          message = Message.new(:warn, message, service, server)
          notifier = Notifier.new(message)
          status = true if notifier.send_nsca
        end
        status
      end

      def critical(service, message = 'CRITICAL')
        status = false
        servers.each do |server|
          message = Message.new(:critical, message, service, server)
          notifier = Notifier.new(message)
          status = true if notifier.send_nsca
        end
        status
      end
    end
  end
end
