require 'jwt'

class Auth

  HMAC_SECRET = ENV['AUTH_SECRET']
  ALGORITHM = 'HS256'

  def self.issue(payload)
    JWT.encode payload, HMAC_SECRET, ALGORITHM
  end
  
  def self.decode(token)
    begin
      JWT.decode(token, HMAC_SECRET, true, { algorithm: ALGORITHM }).first
    rescue Exception
      false
    end
  end
  
end