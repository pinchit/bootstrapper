require 'action_view'
require 'action_controller'
require 'bootstrapper/base'
require 'bootstrapper/request'
require 'bootstrapper/helpers'
require 'bootstrapper/escaper'
require "bootstrapper/version"

class Bootstrapper
  class << self
    def method_missing(method, *args, &block)
      if ( method.to_s =~ /=$/ )
        if public_method_name? method
          raise "You can't use Bootstrapper public methods for storing data"
        end

        set_variable(method.to_s.delete('='), args[0])
      else
        get_variable(method.to_s)
      end
    end

    def all_variables
      Request.bootstrapper
    end

    def clear
      Request.clear
    end

    def inspect
      'Bootstrapper'
    end

    private

    def get_variable(name)
      Request.bootstrapper[name]
    end

    def set_variable(name, value)
      Request.bootstrapper[name] = value
    end

    def public_method_name?(method)
      public_methods.include?(
        if RUBY_VERSION > '1.9'
          method.to_s[0..-2].to_sym
        else
          method.to_s[0..-2]
        end
      )
    end
  end
end
