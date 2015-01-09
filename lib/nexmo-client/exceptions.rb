# encoding: UTF-8

##
# Exceptions for using the Nexmo client
# It is recommended that you handle these.
##

module NEXMO

  class GenericException < StandardError; end

  class TimeoutError < GenericException; end

  # Some problems might take care of themselves if you try again later. Others won't.
  class TemporaryError < GenericException; end # fire warnings on these
  class PermanentError < GenericException; end # fire errors on these

  ## Error codes are based upon:
  ## https://docs.nexmo.com/index.php/verify/search#verify_return_code

  # 1
  class SystemBusy < TemporaryError; end
  # 2 - 4, 15 - 18
  class BadRequest < PermanentError; end
  # 5 - 7  
  class SystemError < TemporaryError; end
  # 8
  class AccessDenied < PermanentError; end
  # 9 
  class InsufficientAppPermission < AccessDenied; end
  # 101 
  class NotFound < PermanentError; end

end
