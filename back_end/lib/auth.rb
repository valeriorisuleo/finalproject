 require 'jwt'

 class Auth
   ALGORITHM = 'HS256'
# creating JWTs
   def self.issue(payload, expiry_in_minutes=60*24*30)
     payload[:exp] = expiry_in_minutes.minutes.from_now.to_i
     JWT.encode(payload, auth_secret, ALGORITHM)
   end
 # decoding JWTs
   def self.decode(token, leeway=0)
     decoded = JWT.decode(token, auth_secret, true, { leeway: leeway, algorithm: ALGORITHM })

  #  We have used HashWithIndifferentAccess to access a hash with either strings or symbols as keys. In this example, we get strings as keys of our hash.

     HashWithIndifferentAccess.new(decoded[0])
   end



   def self.auth_secret
     ENV["AUTH_SECRET"]
   end
 end
