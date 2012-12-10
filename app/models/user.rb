# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)      not null
#  email              :string(255)      not null
#  encrypted_password :string(255)      not null
#  salt               :string(255)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'bcrypt'

class User < ActiveRecord::Base
  has_many :chats, :dependent => :delete_all

  attr_accessor :password
  attr_accessible :name, :email, :password

  email_regex = /\A[\w+\-\.]+@[a-z\d\-\.]+\.[a-z]+\z/i

  validates :name,      :presence => true,
                        :length => { :minimum => 2, :maximum => 50 }
  validates :email,     :presence => true,
                        :format => { :with => email_regex },
                        :uniqueness => { :case_sensitive => false }
  validates :password,  :presence => true,
                        :length => { :within => 6..50 }

  before_save :encrypt_password

  def has_password?(submitted_password)
    logger.debug "DEBUG has_password pass: #{submitted_password} db_pass: #{encrypted_password} gen_pass: #{BCrypt::Password.new(encrypted_password)}"
    db_password = BCrypt::Password.new(encrypted_password)
    db_password == submitted_password
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    logger.debug "DEBUG UserModel authenticate"
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  private
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(plain_text)
      secure_hash("#{salt}--#{plain_text}")
    end

    def make_salt
      BCrypt::Engine.generate_salt
      #secure_hash("#{rand 999999999}")
    end

    def secure_hash(value)
      logger.debug "DEBUG secure_hash #{value}"
      BCrypt::Password.create(value)
      logger.debug "DEBUG secure_hash encrypt #{BCrypt::Password.create(value)}"
      #Digest::SHA2.hexdigest(value)
    end
end
