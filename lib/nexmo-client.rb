# encoding: UTF-8

require 'saddle'

require 'nexmo-client/middleware/exception_raiser'
require 'nexmo-client/version'


module NEXMO

  class Client < Saddle::Client
    #extend NEXMO::Stub

    def initialize args
        args.each do |k,v|
          instance_variable_set("@#{k}", v) unless v.nil?
        end
    end

    def self.host
      @host || 'api.nexmo.com'
    end

    def self.path_prefix
      @path_prefix || nil
    end

    def self.use_ssl
      true
    end

    def self.num_retries
      @num_retries || 2
    end

    def self.timeout
      # seconds
      @timeout || 5
    end

    def self.request_style
      @request_style || :json
    end

    def self.port
      @port || 443
    end

    add_middleware({
      :klass => Middleware::ExceptionRaiser,
    })

  end
end
