require 'readonly'

module ReadOnly
  class Hash
    include ReadOnly::Proxy

    proxied_methods \
      :[],
      :each,
      :each_key,
      :each_pair,
      :each_value,
      :eql?,
      :has_key?,
      :has_value?,
      :inspect,
      :key,
      :keys,
      :length,
      :select,
      :size,
      :to_a,
      :to_h,
      :to_hash,
      :to_s,
      :value,
      :value?,
      :values,
      :values,
      :values_at

    include ReadOnly::DelegateSafeMethods
  end
end
