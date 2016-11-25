module ReadOnly
  module Proxy
    def self.included(klass)
      klass.instance_eval do
        @proxied_methods = []
        class << self
          def proxied_methods(*args)
            @proxied_methods = args if args && !args.empty?
            @proxied_methods
          end
        end
      end # klass.instance_eval
    end

    def initialize(writable_object)
      @delegate = writable_object
    end
  end
end
