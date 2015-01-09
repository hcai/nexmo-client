# encoding: UTF-8

require 'faraday'
require 'nexmo-client/exceptions'


module NEXMO
  module Middleware

    ## Raise beautiful exceptions
    #
    class ExceptionRaiser < Faraday::Middleware

      def call(env)
        begin
          response = @app.call(env)
          verify_return_code = response.body.try(:[], 'status').to_i

          if verify_return_code != 0
            # Error codes are based upon:
            # https://docs.nexmo.com/index.php/verify/search#verify_return_code         

            # Translate our error code into an exception
            exception =
              case verify_return_code
              when 1
                NEXMO::SystemBusy
              when 2..4, 15..18
                NEXMO::BadRequest
              when 5..7
                NEXMO::SystemError
              when 8
                NEXMO::AccessDenied
              when 9
                NEXMO::InsufficientAppPermission
              when 101
                NEXMO::NotFound
              else
                NEXMO::GenericException
              end

            raise exception, response.body.try(:[], 'error_text')
          end
          response
        rescue Saddle::TimeoutError => e
          raise NEXMO::TimeoutError, e.response
        end
      end

    end

  end
end