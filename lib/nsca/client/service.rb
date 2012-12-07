module NSCA
  module Client
    class Service
      attr_accessor :name, :host

      def initialize(options)
        @name = options[:name]
        @host = options[:host] || Host.current
      end
    end
  end
end
