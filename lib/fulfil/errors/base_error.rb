# All errors goes here.
module Fulfil
  class UnauthorizedError < StandardError ; end
  class AuthenticationError < StandardError ; end
  class UserError < StandardError ; end
  class HostResolutionError < StandardError ; end
end
