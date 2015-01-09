# encoding: UTF-8

require 'saddle/endpoint'
module NEXMO
  module Endpoints

    class Verify < Saddle::TraversalEndpoint
    
      def verify_request(number, brand, params = {}, opts = {})
        get("json", params.merge({:number => number, :brand => brand}), opts)
      end

      def check_request(request_id, code, params = {}, opts = {})
        get("check/json", params.merge({:request_id => request_id, :code => code}), opts)
      end

    end
  end
end
