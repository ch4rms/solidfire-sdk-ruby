# This class is necessary for sending requests.
# Sometimes when we're deserializing it, we want
# it to return nil. Sometimes, nothing, and sometimes
# a secret.
class CHAPSecret
  attr_accessor :secret
  # If you initialize a CHAPSecret without a secret, it'll assume you want to autogenerate.
  def initialize(secret = nil)
    @secret = secret
  end

  def self.auto_generate
    return CHAPSecret.new()
  end
end