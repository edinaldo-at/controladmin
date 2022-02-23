require 'openssl'
require 'base64'

module ApplicationHelper
  def decrypt(str, public_key)
    key = Base64.decode64(ENV["CIPHER_KEY"])

    decipher = OpenSSL::Cipher::AES256.new(:CBC)
    decipher.decrypt
    decipher.key = key
    decipher.iv = Base64.decode64(public_key)
    
    decipher.update(Base64.decode64(str)) + decipher.final
  end
end
