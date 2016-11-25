require 'readonly/version'

module ReadOnly
end

Object.class_eval do
  def deep_dup
    if respond_to?(:each_with_object)
      each_with_object(dup) do |(key, value), hash|
        hash[key.deep_dup] = value.deep_dup
      end
    else
      is_a?(Symbol) ? self : dup
    end
  end
end

require 'readonly/proxy'
require 'readonly/delegate_safe_methods'

