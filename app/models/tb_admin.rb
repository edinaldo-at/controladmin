include ActionView::Helpers::TextHelper

class TbAdmin < ApplicationRecord
  after_validation :set_encrypt, on: [ :create, :update ]

  validates :cliente, :computador, :userlocal, :senha, presence: true
  validates :computador, uniqueness: true


  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
        tbAdmin_hash = TbAdmin.new

        tbAdmin_hash.cliente = strip_tags(row[0])
        tbAdmin_hash.computador = strip_tags(row[1])
        tbAdmin_hash.userlocal = strip_tags(row[2])
        tbAdmin_hash.senha = strip_tags(row[3])
        
        tbAdmin_hash.save
    end
  end

  private

    def encrypt(str)
      key = Base64.decode64(ENV["CIPHER_KEY"])
      
      cipher = OpenSSL::Cipher::AES256.new(:CBC)
      cipher.encrypt
      cipher.key = key
      iv = cipher.random_iv

      encrypted = cipher.update(str.to_s) + cipher.final

      {senha: Base64.encode64(encrypted), iv: Base64.encode64(iv)}
    end

    def set_encrypt
      data= encrypt(self.senha)
      
      self.public_key = data[:iv],
      self.senha = data[:senha]
    end
end
