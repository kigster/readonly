module ReadOnly
  module DelegateSafeMethods
    def self.included(klass)
      klass.class_eval do
        proxied_methods.each do |method|
          define_method(method) do |*args, &block|
            @delegate.deep_dup.send(method, *args, &block)
          end
        end
      end
    end
  end
end
